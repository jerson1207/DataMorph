module Resolvers
  class DashboardDatasetsResolver < GraphQL::Schema::Resolver
    type Types::DashboardDatasetType, null: false

    argument :date_from, GraphQL::Types::ISO8601Date, required: false
    argument :date_to, GraphQL::Types::ISO8601Date, required: false

    def resolve(date_from: nil, date_to: nil)
      remaining_service = DashboardDatasetService.new({ date_from: date_from, date_to: date_to })
      transmittals_data = remaining_service.call[:transmittals]

      {
        completed_volume: remaining_service.call[:completed_volume],
        remaining_volume: remaining_service.call[:remaining_volume],
        remaining_volume_per_type: remaining_service.call[:remaining_volume_per_type],
        remaining_volume_per_state: remaining_service.call[:remaining_volume_per_state],
        index: transmittals_data[:index],
        blank_party: transmittals_data[:blank_party],
        collateral: transmittals_data[:collateral],
        special_collateral: transmittals_data[:special_collateral],
        tax_liens: transmittals_data[:tax_liens],
        frames_scanned: transmittals_data[:frames_scanned],
        mdb: transmittals_data[:mdb],
        office_products: transmittals_data[:office_products]
      }
    end
  end
end
