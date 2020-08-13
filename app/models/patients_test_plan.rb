class PatientsTestPlan < ApplicationRecord
  belongs_to :patient
  belongs_to :test_plan
end