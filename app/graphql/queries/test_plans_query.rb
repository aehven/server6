module Queries
  class TestPlansQuery < Queries::BaseQuery
    description "Returns a list of all test plans"

    type [Types::TestPlanType], null: false

    argument :page, Integer, required: false
    argument :perPage, Integer, required: false
    argument :searchTerm, String, required: false

    def resolve(params={})
      current_user = context[:current_user]
      raise CanCan::AccessDenied unless (current_user.can? :read, TestPlan)

      current_user.test_plans + TestPlan.ga
    end

  end
end