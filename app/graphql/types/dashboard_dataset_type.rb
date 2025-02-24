module Types
  class DashboardDatasetType < Types::BaseObject
    field :completed_volume, Integer, null: false
    field :remaining_volume, Integer, null: false
    field :remaining_volume_per_type, GraphQL::Types::JSON, null: false
    field :remaining_volume_per_state, GraphQL::Types::JSON, null: false
    field :index, Types::TransmittalsType, null: false
    field :blank_party, Types::TransmittalsType, null: false
    field :collateral, Types::TransmittalsType, null: false
    field :special_collateral, Types::TransmittalsType, null: false
    field :tax_liens, Types::TransmittalsType, null: false
    field :frames_scanned, Types::TransmittalsType, null: false
    field :mdb, Types::TransmittalsType, null: false
    field :office_products, Types::TransmittalsType, null: false
  end
end
