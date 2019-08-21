require_relative 'boot'

require "rails"
# Pick the frameworks you want:
require "active_model/railtie"
require "active_job/railtie"
require "active_record/railtie"
require "active_storage/engine"
require "action_controller/railtie"
require "action_mailer/railtie"
require "action_mailbox/engine"
require "action_text/engine"
require "action_view/railtie"
require "action_cable/engine"
# require "sprockets/railtie"
require "rails/test_unit/railtie"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Server
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 6.0

    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration can go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded after loading
    # the framework and any gems in your application.

    # Only loads a smaller set of middleware suitable for API only apps.
    # Middleware like session, flash, cookies can be added back manually.
    # Skip views, helpers and assets when generating a new resource.
    config.api_only = true

    #to skip assets, scaffolds.css, test framework, helpers, view
    #https://stackoverflow.com/a/28962604/5874744
    config.generators do |g|
      g.template_engine nil #to skip views
      g.test_framework  nil #to skip test framework
      g.assets  false
      g.helper false
      g.stylesheets false
    end

    config.middleware.insert_before 0, Rack::Cors do
       allow do
         origins '*'
         resource '*',
         :headers => :any,
         :methods => [:get, :post, :options, :delete, :head, :patch],
         :expose  => ['access-token', 'expiry', 'token-type', 'uid', 'client', 'app-version', 'notification']
       end
    end

    config.serve_static_asstets = true

    # for web app only
    # config.action_cable.allowed_request_origins = ENV["ACTION_CABLE_ALLOWED_REQUEST_ORIGINS"]&.split(",")&.map(&:strip)
    # for connections from cordova apps also
    config.action_cable.disable_request_forgery_protection = true

    config.cache_store = :redis_store, ENV['REDIS_URL']
    config.active_record.cache_versioning = false
    config.active_job.queue_adapter = :delayed_job

    config.hosts.clear
  end
end
