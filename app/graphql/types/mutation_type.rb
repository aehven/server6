module Types
  class MutationType < Types::BaseObject
    field :cteData, mutation: Mutations::CteDataMutation
    field :cteDex, mutation: Mutations::CteDexMutation
    field :cteLog, mutation: Mutations::CteLogMutation

    field :patient, mutation: Mutations::PatientMutation
    
    field :test, mutation: Mutations::TestMutation
    field :testPlan, mutation: Mutations::TestPlanMutation
    
    field :user, mutation: Mutations::UserMutation
    field :user_authenticate, mutation: Mutations::UserAuthenticate
  end
end
