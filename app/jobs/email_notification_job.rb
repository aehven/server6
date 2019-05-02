class EmailNotificationJob < ApplicationJob
  queue_as :email_notification
  
  def perform(notification)
    notification.users.each do |user|
      next if user.unsubscribed?
      GenericMailer.notification(notification, user).deliver
    end
  end
end
