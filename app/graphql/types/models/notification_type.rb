module Types
  class NotificationType < Types::BaseObject
    field :id, ID, null: false
    field :created_at, GraphQL::Types::ISO8601DateTime, null: false
    field :updated_at, GraphQL::Types::ISO8601DateTime, null: false
    field :title, String, null: true
    field :text, String, null: true
    field :level, String, null: true
    field :expires_at, GraphQL::Types::ISO8601DateTime, null: true
    field :in_app, Boolean, null: true
    field :email, Boolean, null: true
    field :sms, Boolean, null: true
    field :action, String, null: true
    field :href, String, null: true
    field :duration, Integer, null: true
  end
end
