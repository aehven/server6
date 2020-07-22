module Types
  class TestPlansTestType < Types::BaseObject
    field :id, ID, null: false
    field :test_plan, Types::TestPlanType, null: false
    field :test, Types::TestType, null: false
    field :duration, Integer, null: false
    field :high_res, Boolean, null: false
  end
end
