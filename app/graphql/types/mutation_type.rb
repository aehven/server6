module Types
  class MutationType < Types::BaseObject
    field :test, mutation: Mutations::Test
    field :user, mutation: Mutations::User
    field :user_authenticate, mutation: Mutations::UserAuthenticate
  end
end
