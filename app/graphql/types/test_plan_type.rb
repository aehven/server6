module Types
  class TestPlanType < Types::BaseObject
    field :id, ID, null: false
    field :name, String, null: false

    field :tests, [Types::TestType], null: false
  end
end
