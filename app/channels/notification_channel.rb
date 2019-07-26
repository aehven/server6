class NotificationChannel < ApplicationCable::Channel
  def subscribed
    logger.info("#{current_user} subscribed to NotificationChannel")

    stream_for current_user

    notification = Notification.new(title: "Sign-in", text: "Signed in as #{current_user.email}", level: :Info, in_app: true, duration: 3)
    NotificationChannel.broadcast_to current_user, NotificationSerializer.new(notification).attributes
  end
end
# NotificationChannel.broadcast_to User.first, "hi"
