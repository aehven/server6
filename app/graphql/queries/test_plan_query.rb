module Queries
  class TestPlanQuery < Queries::BaseQuery
    description "Get one test plan."

    type Types::TestPlanType, null: false

    argument :id, ID, required: true

    def resolve(id:)
      @test_plan = TestPlan.find(id)
      
      raise CanCan::AccessDenied unless (context[:current_user].can? :read, @test_plan)

      @test_plan
    end
  end
end