module Queries
  class PatientsQuery < Queries::BaseQuery
    description "Returns a list of all patients"

    type [Types::PatientType], null: false

    argument :page, Integer, required: false
    argument :perPage, Integer, required: false
    argument :searchTerm, String, required: false

    def resolve(params={})
      if(context[:ability].can? :index, Notification)
        Patient.all
      else
        raise CanCan::AccessDenied
      end
    end

  end
end