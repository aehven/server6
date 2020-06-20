module Types
  class MutationType < Types::BaseObject
    field :create_user, mutation: Mutations::CreateUser
    field :user_authenticate, mutation: Mutations::UserAuthenticate
  end
end
