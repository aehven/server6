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
    field :dob, GraphQL::Types::ISO8601DateTime, null: true

    field :full_name, String, null: true
    
    field :users, [Types::UserType], null: true
    field :doctors, [Types::UserType], null: true

    field :ctes, [Types::CteType], null: true
    field :test_plans, [Types::TestPlanType], null: true
  end
end
