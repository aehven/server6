module Types
  class CteDataType < Types::BaseObject
    field :id, ID, null: false
    field :cte_id, Integer, null: true
    field :timestamp, Integer, null: true
    field :content, String, null: true
    field :dataset_number, Integer, null: true
    field :created_at, GraphQL::Types::ISO8601DateTime, null: false
    field :updated_at, GraphQL::Types::ISO8601DateTime, null: false
  end
end
