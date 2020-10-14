module Queries
  class TestPlansQuery < Queries::BaseQuery
    description "Returns a list of all test plans"

    type [[Types::TestPlanType]], null: false

    argument :page, Integer, required: false
    argument :perPage, Integer, required: false
    argument :searchTerm, String, required: false

    def resolve(params={})
      current_user = context[:current_user]
      # raise CanCan::AccessDenied unless (current_user.can? :read, TestPlan)

      my_test_plans = current_user.test_plans
      org_test_plans = current_user.organization.test_plans - my_test_plans if current_user.organization.test_plans.any?
      
      [my_test_plans, org_test_plans, TestPlan.ga]
    end
  end
end