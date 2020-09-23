module Types
  class CteType < Types::BaseObject
    field :id, ID, null: false
    field :name, String, null: true
    field :radio_id, Integer, null: true
    field :serial_number, String, null: true
    field :encryption_key, String, null: true
    field :created_at, GraphQL::Types::ISO8601DateTime, null: false
    field :updated_at, GraphQL::Types::ISO8601DateTime, null: false

    field :last_dataset_number, Integer, null: true
  end
end
