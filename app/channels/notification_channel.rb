class NotificationChannel < ApplicationCable::Channel
  def subscribed
    stream_for current_user
    notify_signed_in
  end

  def notify_signed_in
    logger.debug "NOTIFIY_SIGNED_IN"
    notification = Notification.new(title: "Sign-in", text: "Signed in as #{current_user.email}", level: :Info, in_app: true, duration: 3)
    NotificationChannel.broadcast_to current_user, NotificationSerializer.new(notification).attributes
  end
end
# NotificationChannel.broadcast_to User.first, "hi"
