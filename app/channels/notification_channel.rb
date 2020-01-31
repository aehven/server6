class NotificationChannel < ApplicationCable::Channel
  def subscribed
    stream_from "notification:notifications_for_#{params[:user_id]}"
    # notify_signed_in
  end

  def notify_signed_in
    logger.debug "NOTIFIY_SIGNED_IN"
    notification = Notification.new(title: "Sign-in", text: "Signed in as #{current_user.email}", level: :Info, in_app: true, duration: 3)
    NotificationChannel.broadcast_to "notifications_for_#{current_user.id}", NotificationSerializer.new(notification).attributes
  end
end
