module Mutations
  class TestPlanMutation < BaseMutation
    argument :id, ID, required: false
    argument :name, String, required: true
    argument :tests, [Types::TestPlanTestInput], required: false

    type Types::TestPlanType

    def resolve(params={})
      Rails.logger.debug("TestPlanMutation tests: #{params[:tests]}")

      raise CanCan::AccessDenied unless context[:current_user].can? :create, TestPlan

      @test_plan = params[:id].nil? ? TestPlan.new : TestPlan.find(params[:id])

      @test_plan.update_attributes(params.slice(:name))
      @test_plan.save

      @test_plan.tests = []

      params[:tests].each do |test|
        TestPlansTest.create(test_id: test.testId, test_plan_id: @test_plan.id, duration: test.duration)
      end

      @test_plan
    end
  end
end