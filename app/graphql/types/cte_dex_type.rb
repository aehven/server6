module Types
  class CteDexType < Types::BaseObject
    field :id, ID, null: false
    field :cte_id, Integer, null: true
    field :file_name, String, null: true
    field :content, String, null: true
    field :created_at, GraphQL::Types::ISO8601DateTime, null: false
    field :updated_at, GraphQL::Types::ISO8601DateTime, null: false
  end
end
