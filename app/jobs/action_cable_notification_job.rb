class ActionCableNotificationJob < ApplicationJob
  queue_as :action_cable_notification

  def perform(params)
    user = User.find(params[:user_id])
    notification = params[:notification] || Notification.find(params[:notification_id])
    NotificationChannel.broadcast_to user, notification
  end
end
