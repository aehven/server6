module Types
  class PatientType < Types::BaseObject
    field :id, ID, null: false
    field :first_name, String, null: true
    field :last_name, String, null: true
    field :email, String, null: true
    field :phone, String, null: true
    field :address1, String, null: true
    field :address2, String, null: true
    field :city, String, null: true
    field :state, String, null: true
    field :zip, String, null: true
    field :country, String, null: true
    field :surgery_date, GraphQL::Types::ISO8601DateTime, null: true

    field :users, [Types::UserType], null: true
  end
end
