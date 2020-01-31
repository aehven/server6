class NotificationSerializer < ActiveModel::Serializer
  attributes :text, :action, :duration, :href, :id, :level, :in_app, :email, :sms, :expires_at, :title, :created_at
end
