class TestPlan < ApplicationRecord
  has_paper_trail

  has_many :test_plans_tests
  has_and_belongs_to_many :tests, through: :test_plans_tests

  has_many :patient_test_plans
  has_and_belongs_to_many :patients, through: :patient_test_plans

  has_many :organization_test_plans
  has_and_belongs_to_many :organizations, through: :organization_test_plans
end