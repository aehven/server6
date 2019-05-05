# https://github.com/lynndylanhurley/devise_token_auth/issues/986#issuecomment-338290148
# AND
# https://github.com/lynndylanhurley/devise_token_auth/issues/986#issuecomment-355798258
module ApplicationCable
  class Connection < ActionCable::Connection::Base
    identified_by :current_user

    def connect
      self.current_user = find_verified_user_wst
      # `say "cable connected for #{current_user.first_name}"`
      logger.add_tags 'ActionCable', current_user.id
    end

    private
      # https://github.com/lynndylanhurley/devise_token_auth/issues/986#issuecomment-338290148
      def find_verified_user
        logger.debug "CONNECTION request.query_parameters: #{request.query_parameters}"
        accessToken = request.query_parameters[:accessToken]
        uid = request.query_parameters[:uid]
        client_id = request.query_parameters[:client]

        user = User.find_by_uid(uid)

        if user && user.valid_token?(accessToken, client_id)
          user
        else
          reject_unauthorized_connection
        end
      end

      def find_verified_user_wst
        logger.debug "CONNECTION request.query_parameters: #{request.query_parameters}"
        uid = request.query_parameters[:uid]
        websocket_token = request.query_parameters[:wst]

        user = User.find_by(uid: uid, websocket_token: websocket_token)

        if user
          logger.debug "CONNECTION Accepted"
          user
        else
          logger.debug "CONNECTION Rejected"
          reject_unauthorized_connection
        end
      end
  end
end
