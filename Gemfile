source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.6.5'

gem 'rails', '~> 6.0'
gem 'mysql2'
gem 'puma', '~> 3.11'
gem 'rack-cors'
gem 'bootsnap', '>= 1.4.2', require: false

# gem 'devise_token_auth'
gem 'knock'
gem 'figaro'
gem 'cancancan'
gem 'active_model_serializers'
gem 'will_paginate'
gem 'redis-rails'
gem 'awesome_nested_set', git: "https://github.com/collectiveidea/awesome_nested_set", branch: "master"
gem 'delayed_job_active_record'
gem 'daemons'
gem 'paper_trail'
gem 'rswag'

group :development, :test do
  gem 'pry-rails'
  gem 'pry-byebug'
  gem 'faker'
  gem 'factory_bot_rails'
  gem 'mailcatcher-api' #note that mailcatcher itself has to be installed outside the gemfile because from inside we end up with a very old version due to a dependency bug
  gem 'rspec-rails'
  gem 'capybara'
  gem 'capybara-screenshot'
  gem 'selenium-webdriver'
  gem 'rb-readline'
end

group :development do
  gem 'listen', '>= 3.0.5', '< 3.2'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  # gem 'spring'
  # gem 'spring-watcher-listen', '~> 2.0.0'
end

group :production do
  gem 'rails_12factor'
end


# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]

gem "graphql", "~> 1.11"

gem "graphiql-rails", "~> 1.7"
