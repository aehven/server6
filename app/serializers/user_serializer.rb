class UserSerializer < ActiveModel::Serializer
  attributes :id, :first_name, :last_name, :email, :role, :customer_name, :customer_id
  attributes :permissions, :wst, :server
  attributes :tac_agreed_at

  def permissions
    flatten_hash(object.permissions).keys.map(&:to_s)
  end

  def wst
    object.websocket_token
  end

  def customer_name
    object.customer&.name || "Binary Trees"
  end

  # https://stackoverflow.com/a/40667799/5874744
  def flatten_hash(param, prefix=nil)
    param.each_pair.reduce({}) do |a, (k, v)|
      v.is_a?(Hash) ? a.merge(flatten_hash(v, "#{prefix}#{k}.")) : a.merge("#{prefix}#{k}".to_sym => v)
    end
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
