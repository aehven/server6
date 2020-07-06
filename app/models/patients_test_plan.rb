class PatientsTestPlan < ApplicationRecord
  belong_to :patient
  belong_to :test_plan
end