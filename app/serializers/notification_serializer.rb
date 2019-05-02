class NotificationSerializer < ActiveModel::Serializer
  attributes :text, :action, :href, :id, :level, :in_app, :email, :sms, :expires_at, :title
end
