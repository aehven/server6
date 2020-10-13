module Types
  class SurgeryType < Types::BaseObject
    field :id, ID, null: false
    field :patient_id, ID, null: false
    field :name, String, null: true
    field :date, GraphQL::Types::ISO8601DateTime, null: false
    field :created_at, GraphQL::Types::ISO8601DateTime, null: false
    field :updated_at, GraphQL::Types::ISO8601DateTime, null: false

    field :patient, PatientType, null: false
    field :last_dataset_number, Integer, null: true
  end
end
