module Types
  class OrganizationType < Types::BaseObject
    field :id, ID, null: false
    field :kind, String, null: true
    field :name, String, null: true
    field :address1, String, null: true
    field :address2, String, null: true
    field :city, String, null: true
    field :state, String, null: true
    field :zip, String, null: true
    field :country, String, null: true
    field :phone1, String, null: true
    field :phone2, String, null: true
    field :phone3, String, null: true
    field :email1, String, null: true
    field :email2, String, null: true
    field :email3, String, null: true
    field :active, Boolean, null: true
    field :parent_id, Integer, null: true
    field :lft, Integer, null: false
    field :rgt, Integer, null: false
    field :depth, Integer, null: false
    field :children_count, Integer, null: false
    field :created_at, GraphQL::Types::ISO8601DateTime, null: false
    field :updated_at, GraphQL::Types::ISO8601DateTime, null: false

    field :level, Integer, null: true
    field :users, [Types::UserType], null: true
  end
end
