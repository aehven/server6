module Queries
  class TestPlan < Queries::BaseQuery
    description "Get one test plan."

    type Types::TestPlanType, null: false

    argument :id, ID, required: true

    def resolve(id:)
      @test_plan = ::TestPlan.find(id)
      if(context[:ability].can? :read, @test_plan)
        @test_plan
      else
        raise CanCan::AccessDenied
      end
    end
  end
end