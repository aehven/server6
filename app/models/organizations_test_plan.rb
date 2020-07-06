class OrganizationsTestPlan < ApplicationRecord
  belongs_to :organization
  belongs_to :test_plan
end