module Queries
  class TestPlans < Queries::BaseQuery
    description "Returns a list of all test plans"

    type [Types::TestPlanType], null: false

    argument :page, Integer, required: false
    argument :perPage, Integer, required: false
    argument :searchTerm, String, required: false

    def resolve(params={})
      if(context[:ability].can? :index, Notification)
        ::TestPlan.all
      else
        raise CanCan::AccessDenied
      end
    end

  end
end