module Types
  class MutationType < Types::BaseObject
    field :test, mutation: Mutations::Test
    field :user_create, mutation: Mutations::UserCreate
    field :user_authenticate, mutation: Mutations::UserAuthenticate
  end
end
