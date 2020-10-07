module Types
  class BaseStationType < Types::BaseObject
    field :id, ID, null: false
    field :serial_number, Integer, null: true
    field :active, Boolean, null: false
    field :encryption_key, String, null: true
    field :created_at, GraphQL::Types::ISO8601DateTime, null: false
    field :updated_at, GraphQL::Types::ISO8601DateTime, null: false

    field :last_dataset_number, Integer, null: true
  end
end
