class GenericMailer < ApplicationMailer
  # before_action {
  #   mail.perform_deliveries = false if !@user.unsubscribed_at.nil?
  # }

  def notification(notification, user)
    @user = user
    @notification = notification

    attachments.inline['logo.png'] = File.read("app/assets/images/logo.png") rescue nil
    mail(to: @user.email, subject: notification.title)
  end

  def welcome(user)
    return if user.unsubscribed?

    @user = user

    attachments.inline['logo.png'] = File.read("app/assets/images/logo.png") rescue nil
    mail(to: user.email)
  end
end
