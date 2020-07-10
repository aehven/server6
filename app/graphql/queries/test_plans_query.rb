module Queries
  class TestPlansQuery < Queries::BaseQuery
    description "Returns a list of all test plans"

    type [Types::TestPlanType], null: false

    argument :page, Integer, required: false
    argument :perPage, Integer, required: false
    argument :searchTerm, String, required: false

    def resolve(params={})
      raise CanCan::AccessDenied unless (context[:current_user].can? :index, Notification)

      TestPlan.all
    end

  end
end