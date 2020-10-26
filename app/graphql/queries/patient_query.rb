module Queries
  class PatientQuery < Queries::BaseQuery
    description "Get one patient."

    type Types::PatientType, null: false

    argument :id, ID, required: true

    def resolve(id:)
      @patient = Patient.find(id)

      @patient
    end
  end
end