module Types
  class AuthenticationResponseType < Types::BaseObject
    field :jwt, String, null: false
  end
end