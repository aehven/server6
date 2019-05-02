class UserSerializer < ActiveModel::Serializer
  attributes :id, :first_name, :last_name, :email, :role, :customer_name, :customer_id, :tutorial_number
  attributes :permissions, :wst, :server

  def permissions
    object.permissions
  end

  def wst
    object.websocket_token
  end

  def server
    User.env_vars_to_client
  end

  def customer_name
    object.customer&.name || "Rennicks"
  end
end

class UserDownloadDataSerializer < ActiveModel::Serializer
  attributes  :sign_in_count,
              :current_sign_in_at,
              :last_sign_in_at,
              :current_sign_in_ip,
              :last_sign_in_ip ,
              :email,
              :created_at,
              :first_name,
              :last_name,
              :tac_agreed_at
end
