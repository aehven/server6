class NotificationChannel < ApplicationCable::Channel
  def subscribed
    logger.info("#{current_user} subscribed to NotificationChannel")

    stream_for current_user

    notify_signed_in

    send_first_pending_notification
  end

  def notify_signed_in
    notification = Notification.new(title: "Sign-in", text: "Signed in as #{current_user.email}", level: :Info, in_app: true, duration: 3)
    NotificationChannel.broadcast_to current_user, NotificationSerializer.new(notification).attributes
  end

  def send_first_pending_notification
    notification = current_user.next_notification
    if(notification)
      ActionCableNotificationJob.set(wait: 10).perform_later(user_id: current_user.id, notification_id: notification.id)
    end
  end
end
# NotificationChannel.broadcast_to User.first, "hi"
