require 'jwt'

module ApplicationCable
  class Connection < ActionCable::Connection::Base
    identified_by :current_user

    def connect
      jwt = JWT.decode(request.query_parameters[:jwt], Rails.application.credentials.secret_key_base, { algorithm: 'HS256' })
      current_user = User.find((jwt[0]['sub']))

      if current_user
        logger.add_tags 'ActionCable', current_user.email
        logger.debug "CONNECTION Accepted"
      else
        logger.debug "CONNECTION Rejected"
        reject_unauthorized_connection
      end
    end
  end
end
