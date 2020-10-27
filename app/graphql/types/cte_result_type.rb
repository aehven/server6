module Types
  class CteResultType < Types::BaseObject
    field :id, ID, null: false
    field :sample_bcd_datetime, GraphQL::Types::ISO8601DateTime, null: true
    field :qualified_gait_cycle, Float, null: true
    field :cadence, Float, null: true
    field :stride_length, Float, null: true
    field :walk_speed, Float, null: true
    field :tib_rom, Float, null: true
    field :knee_rom, Float, null: true
  end
end
