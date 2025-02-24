module Types
  class TransmittalsType < Types::BaseObject
    field :unit, Integer, null: false
    field :tat, Float, null: false
    field :sla, Integer, null: false
  end
end
