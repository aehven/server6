module Mutations
  class TestPlanMutation < BaseMutation
    argument :id, ID, required: false
    argument :name, String, required: true
    argument :tests, [Types::TestPlanTestInput], required: false

    type Types::TestPlanType

    def resolve(params={})
      Rails.logger.debug("TestPlanMutation tests: #{params[:tests]}")

      current_user = context[:current_user]

      @test_plan = (params[:id].to_i > 0) ? TestPlan.find(params[:id].to_i) : TestPlan.new(name: params[:name])

      # raise CanCan::AccessDenied unless current_user.can? [:create], @test_plan

      # @test_plan is a new record or an existing one.  If it's an existing one,
      # check if the name is changing; if it is, create a new one anyway, we
      # don't change names, we create new plans.

      if(!@test_plan.new_record? && @test_plan.name != params[:name])
        @test_plan = TestPlan.new(name: params[:name])
      end

      @test_plan.save

      @test_plan.tests = []

      params[:tests]&.each do |test|
        TestPlansTest.create(test_id: test.testId, 
                             test_plan_id: @test_plan.id, 
                             high_res: test.highRes,
                             duration: test.duration)
      end

      OrganizationsTestPlan.create!(test_plan_id: @test_plan.id, organization_id: current_user.organizations.first.id) if current_user.organizations.any?

      @test_plan
    end
  end
end