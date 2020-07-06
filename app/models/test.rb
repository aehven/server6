class Test < ApplicationRecord
  has_paper_trail

  has_many :test_plans_tests
  has_and_belongs_to_many :test_plans, through: :test_plans_tests

  has_many :organization_tests
  has_and_belongs_to_many :organizations, through: :organization_tests
end