class ActionCableNotificationJob < ApplicationJob
  queue_as :action_cable_notification

  def perform(user_id, notification_id)
    user = User.find(user_id)
    notification = Notification.find(notification_id)
    NotificationChannel.broadcast_to user, NotificationSerializer.new(notification).attributes
  end
end
