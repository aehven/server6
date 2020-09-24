class PatientsTestPlan < ApplicationRecord
  belongs_to :patient
  belongs_to :test_plan

  def test_results
    TestResult.where(patients_test_plan_id: id)
  end
end