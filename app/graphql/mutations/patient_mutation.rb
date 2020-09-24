module Mutations
  class PatientMutation < BaseMutation
    #####
    #TODO consider splitting update and create into two separate mutations
    #so that arguments can be required or optional in a stricter way.
    #Right now, everything is optional because udpate might not need them all,
    #and if ID is given then we force it to be an update.....
    #####
    argument :id, ID, required: false, description: "Must be included if updating an existing patient; omit for creating a patient."
    argument :email, String, required: false, description: "Must be included for new patient creation."
    argument :first_name, String, required: false, description: "Must be included for new patient creation."
    argument :last_name, String, required: false, description: "Must be included for new patient creation."
    argument :organization_id, ID, required: false
    argument :test_plan_id, ID, required: false

    type Types::PatientType

    def resolve(params={})
      # raise CanCan::AccessDenied unless context[:current_patient].can?(:create, Patient)

      if(params[:id].nil?)
        @patient = Patient.create!(params)
      else
        @patient = Patient.find(params[:id])

        @patient.update(params.slice(:first_name, :last_name, :email))

        if(params[:test_plan_id])
          @patient.test_plans << TestPlan.find(params[:test_plan_id])
        end
      end

      @patient.save!

      @patient
    end
  end
end