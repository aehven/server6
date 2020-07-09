module Mutations
  class UserAuthenticate < BaseMutation
    argument :email, String, required: true
    argument :password, String, required: true

    type Types::AuthenticationResponseType

    def resolve(email: nil, password: nil)
      entity = ::User.find_by(email: email)

      if entity&.authenticate(password)
        if entity.respond_to? :to_token_payload
          @token = Knock::AuthToken.new payload: entity.to_token_payload
        else
          @token = Knock::AuthToken.new payload: { sub: entity.id }
        end

        vars = ENV.select{|k, v| k.start_with? "BTSTC_"}
        vars["BTSTC_ORGANIZATION_KINDS"] = Organization.kinds.keys
    
        { jwt: @token.token, user: entity, server: vars.to_json }
      else
        raise CanCan::AccessDenied
      end
    end
  end
end