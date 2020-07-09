module Types
  class AuthenticationResponseType < Types::BaseObject
    field :jwt, String, null: false
    field :user, Types::UserType, null: false
    field :server, String, null: true, description: "Server-side settings of interest to the client"
  end
end