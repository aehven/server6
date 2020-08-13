module Queries
  class PatientsQuery < Queries::BaseQuery
    description "Returns a list of all patients"

    type [Types::PatientType], null: false

    argument :page, Integer, required: false
    argument :perPage, Integer, required: false
    argument :searchTerm, String, required: false
    argument :organizationId, Integer, required: false

    def resolve(params={})
      user = context[:current_user]

      raise CanCan::AccessDenied unless (user.can? :index, Patient)

      if(params[:organizationId])
        if(context[:current_user].can? :read, Organization.find(organization_id))
          @patients = Organization.find(params[:organizationId]).patients
        end
      else
        if(user.can? :manage, :all)
          @patients = Patient.all
        else
          @patients = user.patients
        end
      end

      @patients = @patients.search(params[:searchTerm]) if params[:searchTerm]
      
      @patients
    end

  end
end