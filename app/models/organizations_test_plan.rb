class OrganizationsTestPlan < ApplicationRecord
  belongs_to :organization, optional: true
  belongs_to :test_plan
end