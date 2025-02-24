class DashboardDatasetService
  SLA_DAYS = {
    index: 14, blank_party: 14, collateral: 14, special_collateral: 14,
    tax_liens: 14, frames_scanned: 0, mdb: 7, office_products: 30
  }.freeze

  FILTERS = {
    index: { unit: :index_units_transmitted, tat: :tat_index, date: :index_date_transmitted },
    blank_party: { unit: :blank_party_units_transmitted, tat: :tat_blank_party, date: :blank_party_date_transmitted },
    collateral: { unit: :collateral_units_transmitted, tat: :tat_collateral, date: :collateral_date_transmitted },
    special_collateral: { unit: :special_collateral_units_transmitted, tat: :tat_special_collateral, date: :special_collateral_date_transmitted },
    tax_liens: { unit: :tax_liens_units_transmitted, tat: :tat_tax_liens, date: :tax_liens_date_transmitted },
    frames_scanned: { unit: :frames_scanned_units_transmitted, tat: nil, date: :frames_scanned_date_transmitted },
    mdb: { unit: :mdb_units_transmitted, tat: :tat_mdb, date: :mdb_date_transmitted },
    office_products: { unit: :office_products_units_transmitted, tat: :tat_office_products, date: :office_products_date_transmitted }
  }.freeze

  attr_reader :params, :records

  def initialize(params)
    @params = params
    load_records # Load records once into memory
  end

  def call
    {
      completed_volume: completed_volume,
      remaining_volume: remaining_volume,
      remaining_volume_per_type: remaining_volume_per_type,
      remaining_volume_per_state: remaining_volume_per_state,
      transmittals: fetch_transmittals
    }
  end

  private

  def load_records
    @records ||= UccInventory
                   .where(date_received: params[:date_from]..params[:date_to])
  end

  def completed_volume
    records.select { |record| any_valid_date?(record) }
           .sum(&:filings_received_volume)
  end

  def remaining_volume
    records.reject { |record| any_valid_date?(record) }
           .sum(&:filings_received_volume)
  end

  def remaining_volume_per_type
    records.select { |record| any_valid_date?(record) }
           .group_by(&:inventory_type)
           .transform_values { |grouped_records| grouped_records.sum(&:filings_received_volume) }
  end

  def remaining_volume_per_state
    records.select { |record| any_valid_date?(record) }
           .group_by(&:state_code)
           .transform_values { |grouped_records| grouped_records.sum(&:filings_received_volume) }
  end

  def any_valid_date?(record)
    [
      record.index_date_transmitted,
      record.blank_party_date_transmitted,
      record.collateral_date_transmitted,
      record.special_collateral_date_transmitted,
      record.tax_liens_date_transmitted,
      record.frames_scanned_date_transmitted,
      record.mdb_date_transmitted,
      record.office_products_date_transmitted
    ].any?(&:present?)
  end

  def fetch_transmittals
    {
      index: transmittal_data(:index),
      blank_party: transmittal_data(:blank_party),
      collateral: transmittal_data(:collateral),
      special_collateral: transmittal_data(:special_collateral),
      tax_liens: transmittal_data(:tax_liens),
      frames_scanned: transmittal_data(:frames_scanned),
      mdb: transmittal_data(:mdb),
      office_products: transmittal_data(:office_products)
    }
  end

  def transmittal_data(filter_type)
    filter_config = FILTERS[filter_type]
    filtered_scope = apply_filters(filter_type)

    unit_total = filtered_scope.sum { |item| item[filter_config[:unit]] || 0 }
    tat_average = if filter_config[:tat]
                    tat_values = filtered_scope.pluck(filter_config[:tat]).compact.map(&:to_f)
                    tat_values.any? ? (tat_values.sum / tat_values.size).round(2) : ""
    else
                    ""
    end

    # Return the data for this transmittal type
    {
      unit: unit_total,
      tat: tat_average,
      sla: SLA_DAYS[filter_type]
    }
  end

  def apply_filters(filter_type)
    return records unless date_filter_present?

    filter_config = FILTERS[filter_type]
    date_column = filter_config[:date]
    date_from, date_to = params.values_at(:date_from, :date_to).map(&:to_date)

    records.where("#{date_column} BETWEEN ? AND ?", date_from, date_to)
  end

  def date_filter_present?
    params[:date_from].present? && params[:date_to].present?
  end
end
