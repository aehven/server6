module Types
  class FirmwareType < Types::BaseObject
    field :id, ID, null: false
    field :kind, String, null: false
    field :major, Integer, null: false
    field :minor, Integer, null: false
    field :bugfix, Integer, null: false
    field :build, Integer, null: false
    field :critical, Boolean, null: false
    field :image, String, null: false
    field :created_at, GraphQL::Types::ISO8601DateTime, null: false
    field :updated_at, GraphQL::Types::ISO8601DateTime, null: false
  end
end
