module Types
  class MutationType < Types::BaseObject
    field :user_create, mutation: Mutations::UserCreate
    field :user_authenticate, mutation: Mutations::UserAuthenticate
  end
end
