class ActionCableNotificationJob < ApplicationJob
  queue_as :action_cable_notification

  def perform(params)
    notification = params[:notification] || Notification.find(params[:notification_id])

    if(params[:user_ids] == "all")
      NotificationChannel.broadcast_to "notifications_for_", notification
    else
      users = User.find(params[:user_ids])
      users.each do |user|
        NotificationChannel.broadcast_to "notifications_for_#{user.id}", notification
      end
    end
  end
end
