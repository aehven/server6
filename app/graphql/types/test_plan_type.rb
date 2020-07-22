module Types
  class TestPlanType < Types::BaseObject
    field :id, ID, null: false
    field :name, String, null: false
    field :test_plans_tests, [Types::TestPlansTestType], null: false
  end
end
