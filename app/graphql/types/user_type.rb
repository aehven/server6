module Types
  class UserType < Types::BaseObject
    field :id, ID, null: false
    field :password_digest, String, null: false
    field :reset_password_token, String, null: true
    field :reset_password_sent_at, GraphQL::Types::ISO8601DateTime, null: true
    field :sign_in_count, Integer, null: false
    field :current_sign_in_at, GraphQL::Types::ISO8601DateTime, null: true
    field :last_sign_in_at, GraphQL::Types::ISO8601DateTime, null: true
    field :current_sign_in_ip, String, null: true
    field :last_sign_in_ip, String, null: true
    field :first_name, String, null: true
    field :last_name, String, null: true
    field :nickname, String, null: true
    field :image, String, null: true
    field :email, String, null: true
    field :role, Integer, null: true
    field :tac_agreed_at, GraphQL::Types::ISO8601DateTime, null: true
    field :unsubscribe_token, String, null: true
    field :unsubscribed_at, GraphQL::Types::ISO8601DateTime, null: true
    field :created_at, GraphQL::Types::ISO8601DateTime, null: false
    field :updated_at, GraphQL::Types::ISO8601DateTime, null: false

    field :full_name, String, null: false
    def full_name
      [object.first_name, object.last_name].compact.join(' ')
    end
  end
end
