module Types
  class MutationType < Types::BaseObject
    field :cteData, mutation: Mutations::CteDataMutation
    field :test, mutation: Mutations::TestMutation
    field :testPlan, mutation: Mutations::TestPlanMutation
    field :user, mutation: Mutations::UserMutation
    field :user_authenticate, mutation: Mutations::UserAuthenticate
  end
end
