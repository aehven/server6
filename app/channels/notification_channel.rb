class NotificationChannel < ApplicationCable::Channel
  def subscribed
    logger.info("#{current_user} subscribed to NotificationChannel")

    stream_for current_user
  end
end
# NotificationChannel.broadcast_to User.first, "hi"
