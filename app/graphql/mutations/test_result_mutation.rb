module Mutations
  class TestResultMutation < BaseMutation
    argument :cte_radio_id, type: Integer, required: true
    argument :start_time, type: Integer, required: true
    argument :dataset_number, Integer, required: true
    argument :status, Integer, required: true
    argument :notes, [Integer], required: true

    type Types::TestResultType

    def resolve(params={})
      patient = Cte.find_by(radio_id: params[:cte_radio_id]).patients.last
      patients_test_plan_id = patient.patients_test_plans.last&.id || PatientsTestPlan.create(patient_id: patient.id).id

      TestResult.create!(
        patients_test_plan_id: patients_test_plan_id,
        start_time: params[:start_time],
        dataset_number: params[:dataset_number],
        status: params[:status],
        notes: params[:notes]
      )
    end
  end
end