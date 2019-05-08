require 'spec_helper'

require File.expand_path('../../config/environment', __FILE__)

abort("The Rails environment is running in production mode!") if Rails.env.production?

require 'rspec/rails'

require 'factory_bot'
require 'faker'
require 'capybara-screenshot/rspec'

require Rails.root.join('spec/support/components/base_component.rb')
Dir[Rails.root.join('spec/support/**/*.rb')].each { |f| require f }

# Checks for pending migrations and applies them before tests are run.
# If you are not using ActiveRecord, you can remove this line.
ActiveRecord::Migration.maintain_test_schema!

include Helpers

RSpec.configure do |config|
  config.include FactoryBot::Syntax::Methods

  config.example_status_persistence_file_path = "examples.txt"

  config.infer_spec_type_from_file_location!

  config.filter_rails_from_backtrace!

  config.before(:each) do
    reset_db
    bring_window_to_front unless ENV['STAY_BACK']
  end

  config.after(:suite) do
    spawn "afplay /System/Library/Sounds/Bottle.aiff; afplay /System/Library/Sounds/Frog.aiff; afplay /System/Library/Sounds/Funk.aiff"
  end

  # config.after(:each) do
  #   print "\a"
  # end

  # copied from screenshot gem rspec.rb line ~93
  config.after(type: :feature) do |example_from_block_arg|
    example = config.respond_to?(:expose_current_running_example_as) ? example_from_block_arg : self.example

    if(example.exception)
      spawn "afplay /System/Library/Sounds/Basso.aiff"
    else
      spawn "afplay /System/Library/Sounds/Glass.aiff"
    end
  end


#####################################

  config.prepend_after(:each, type: :feature) do
    clear_local_storage
  end

  config.include Capybara::DSL

  Capybara.configure do |cconfig|
    cconfig.default_driver = :selenium_chrome
    cconfig.app_host = "http://#{ENV['NICKNAME']}"
    cconfig.asset_host = "http://#{ENV['NICKNAME']}"
    cconfig.default_max_wait_time = 3
    cconfig.run_server = false
  end

  Capybara.register_driver :selenium_chrome do |app|
    options = Selenium::WebDriver::Chrome::Options.new

    capHash = {loggingPrefs: { browser: 'ALL'}}

    if(ENV['H'])
      capHash[:chromeOptions] = { args: %w(headless disable-gpu) }
    else
      options.add_argument("--window-size=1000,1000") #(x,y)
    end

    caps = Selenium::WebDriver::Remote::Capabilities.chrome(capHash)

    Capybara::Selenium::Driver.new(app,
      browser: :chrome,
      options: options,
      desired_capabilities: caps
    )
  end

  Capybara::Screenshot.register_filename_prefix_formatter(:rspec) do |example|
    return if ENV['SKIP_SCREENSHOTS']
    "screenshots/#{example.file_path.split("/").last}_#{example.full_description.gsub(/\:|\s+/, '-').gsub(/^.*\/spec\//,'')}" ##{example.file_path}-
  end

  Capybara::Screenshot.after_save_html do |path|
    system("open #{path}")
  end
end
