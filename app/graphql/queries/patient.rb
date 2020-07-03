module Queries
  class Patient < Queries::BaseQuery
    description "Get one patient."

    type Types::PatientType, null: false

    argument :id, ID, required: true

    def resolve(id:)
      @patient = ::Patient.find(id)
      if(context[:ability].can? :read, @patient)
        @patient
      else
        raise CanCan::AccessDenied
      end
    end
  end
end