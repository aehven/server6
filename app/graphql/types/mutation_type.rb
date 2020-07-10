module Types
  class MutationType < Types::BaseObject
    field :user, mutation: Mutations::UserMutation
    field :user_authenticate, mutation: Mutations::UserAuthenticate
  end
end
