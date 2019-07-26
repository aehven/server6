class ActionCableNotificationJob < ApplicationJob
  queue_as :action_cable_notification

  def perform(user_id, text)
    user = User.find(user_id)
    NotificationChannel.broadcast_to user, text
  end
end
