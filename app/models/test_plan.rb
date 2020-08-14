class TestPlan < ApplicationRecord
  has_paper_trail

  has_many :test_plans_tests
  has_and_belongs_to_many :tests, through: :test_plans_tests

  has_many :patient_test_plans
  has_and_belongs_to_many :patients, through: :patient_test_plans

  has_many :organization_test_plans
  has_and_belongs_to_many :organizations, through: :organization_test_plans

  def self.organization
    ids = ActiveRecord::Base.connection.exec_query("select distinct test_plan_id from organizations_test_plans;").rows.flatten
    where(id: ids)
  end

  def self.patient
    ids = ActiveRecord::Base.connection.exec_query("select distinct test_plan_id from patients_test_plans;").rows.flatten
    where(id: ids)
  end

  def self.ga
    ids = ActiveRecord::Base.connection.exec_query("select distinct test_plan_id from organizations_test_plans;").rows.flatten
    ids = ids + ActiveRecord::Base.connection.exec_query("select distinct test_plan_id from patients_test_plans;").rows.flatten    
    TestPlan.where.not(id: ids)
  end
end