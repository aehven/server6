module Mutations
  class UserAuthenticate < BaseMutation
    argument :email, String, required: true
    argument :password, String, required: true

    type Types::AuthenticationResponseType

    def resolve(email: nil, password: nil)
      entity = User.find_by(email: email)

      return unless entity.authenticate(password)

      if entity.respond_to? :to_token_payload
        @token = Knock::AuthToken.new payload: entity.to_token_payload
      else
        @token = Knock::AuthToken.new payload: { sub: entity.id }
      end

      { jwt: @token.token }
    end
  end
end