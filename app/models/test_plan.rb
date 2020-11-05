class TestPlan < ApplicationRecord
  has_paper_trail

  has_many :test_plans_tests
  has_many :tests, through: :test_plans_tests

  has_many :patient_test_plans
  has_many :patients, through: :patient_test_plans

  has_many :organizations_test_plans
  has_many :organizations, through: :organizations_test_plans

  has_many :test_plans_users
  has_many :users, through: :test_plans_users

  after_create :assign

  def assign
    if(User.current)
      TestPlansUser.create!(test_plan_id: self.id, user_id: User.current.id)

      if(User.current.organization)
        OrganizationsTestPlan.create!(test_plan_id: self.id, organization_id: User.current.organization.id)
      end
    end
  end

  def self.organization
    ids = ActiveRecord::Base.connection.exec_query("select distinct test_plan_id from organizations_test_plans;").rows.flatten
    where(id: ids)
  end

  def self.ga
    ids = TestPlansUser.where(user_id: nil)
    TestPlan.where(id: ids)
  end
end