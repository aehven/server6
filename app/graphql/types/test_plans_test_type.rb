module Types
  class TestPlansTestType < Types::BaseObject
    field :id, ID, null: false
    field :test_id, ID, null: false
    field :test_plan_id, ID, null: false
  end
end
