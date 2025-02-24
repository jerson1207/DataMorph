class TransmittalService
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

  attr_reader :scope, :params

  def initialize(params)
    @params = params
    @scope = UccInventory.all
  end

  def call
  end

  FILTERS.keys.each do |filter_type|
    define_method(filter_type) do
      summary(filter_type)
    end
  end

  private

  def summary(filter_type)
    filtered_scope = apply_filters(filter_type)
    filter_config = FILTERS[filter_type]

    unit_total = filtered_scope.sum { |item| item[filter_config[:unit]] || 0 }

    tat_average =
      if filter_config[:tat]
        tat_values = filtered_scope.pluck(filter_config[:tat]).compact.map(&:to_f)
        tat_values.any? ? (tat_values.sum / tat_values.size).round(2) : ""
      else
        ""
      end

    {
      unit: unit_total,
      tat: tat_average,
      sla: SLA_DAYS[filter_type]
    }
  end

  def apply_filters(filter_type)
    reset_filters if filter_params_changed?

    return scope unless date_filter_present?  # Avoid unnecessary queries if no date filter

    filter_config = FILTERS[filter_type]
    date_column = filter_config[:date]
    date_from, date_to = params.values_at(:date_from, :date_to).map(&:to_date)

    @filtered_scope ||= scope.where("#{date_column} BETWEEN ? AND ?", date_from, date_to)
  end

  def date_filter_present?
    params[:date_from].present? && params[:date_to].present?
  end

  def filter_params_changed?
    # Logic to detect if filter parameters have changed
    params[:date_from] != @previous_date_from || params[:date_to] != @previous_date_to
  end

  def reset_filters
    @filtered_scope = nil  # Reset the memoized filtered scope
    @previous_date_from = params[:date_from]  # Store the current filter values for future comparison
    @previous_date_to = params[:date_to]
  end
end
