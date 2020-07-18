module Queries
  class TestPlansTestQuery < Queries::BaseQuery
    description "Get one test-plans-test."

    type Types::TestPlansTestType, null: false

    argument :id, ID, required: true

    def resolve(id:)
      @test_plans_test = TestPlansTest.find(id)
      
      raise CanCan::AccessDenied unless (context[:current_user].can? :read, @test_plan)

      @test_plans_test
    end
  end
end