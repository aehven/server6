# Load the Rails application.
require_relative 'application'

Rails.application.configure do
  config.active_job.queue_adapter = :delayed_job
end

# Initialize the Rails application.
Rails.application.initialize!

ActionMailer::Base.delivery_method = :smtp
ActionMailer::Base.perform_deliveries = true
ActionMailer::Base.raise_delivery_errors = true
ActionMailer::Base.smtp_settings = {
  :address        => ENV['SMTP_URL'],
  :port           => ENV['SMTP_PORT'],
  :authentication => (ENV['SMTP_AUTHENTICATION'] || "cram_md5").to_sym,
  :user_name      => ENV['SMTP_USERNAME'],
  :password       => ENV['SMTP_PASSWORD'],
  :domain         => ENV['SMTP_DOMAIN'],
  :enable_starttls_auto => ENV['SMTP_STARTTLS_AUTO'] == "true" ? true : false
}
