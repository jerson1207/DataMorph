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

  attr_reader :params

  def initialize(params)
    @params = params
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

  def completed_volume
    UccInventory.where(date_received: params[:date_from]..params[:date_to]).sum(:completed_units)
  end

  def remaining_volume
    UccInventory.where(date_received: params[:date_from]..params[:date_to]).sum(:remaining_units)
  end

  def remaining_volume_per_type
    UccInventory.where(date_received: params[:date_from]..params[:date_to]).group(:inventory_type).sum(:remaining_units)
  end

  def remaining_volume_per_state
    UccInventory.where(date_received: params[:date_from]..params[:date_to]).group(:state).sum(:remaining_units)
  end

  def fetch_transmittals
    FILTERS.keys.each_with_object({}) do |filter_type, result|
      filter_config = FILTERS[filter_type]
      filtered_scope = scope.where("#{filter_config} BETWEEN :start_date AND :end_date", start_date: params[:date_from], end_date: params[:date_to])

      unit_total = filtered_scope.sum(filter_config[:unit])
      tat_values = filtered_scope.pluck(filter_config[:tat]).compact.map(&:to_f)
      tat_average = tat_values.any? ? (tat_values.sum / tat_values.size).round(2) : ""

      result[filter_type] = {
        unit: unit_total,
        tat: tat_average,
        sla: SLA_DAYS[filter_type]
      }
    end
  end

  FILTERS = {
    index: { date: :index_date_transmitted },
    collateral: { date: :collateral_date_transmitted },
    tax_liens: { date: :tax_liens_date_transmitted }
  }.freeze

  FILTERS.keys.each do |filter_type|
    define_method(filter_type) do
      summary(filter_type)
    end
  end

  def summary(filter_type)
    filtered_scope = apply_filters(filter_type)

    grouped_data = filtered_scope.group_by { |item| item[:state_code] }.transform_values do |records|
      # Extracting and computing the difference
      differences = records.map do |record|
        received = record[:date_received]
        transmitted = record[:date_from]

        received && transmitted ? (received - transmitted).to_f : nil
      end.compact # Remove nil values

      average = format("%.2f", differences.sum.to_f / differences.size).to_f
    end

    grouped_data
  end
end
