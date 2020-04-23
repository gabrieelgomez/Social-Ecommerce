source 'https://rubygems.org'
ruby "2.5.1"
git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end

#upload

# Set env variables
gem 'dotenv-rails', groups: [:development, :test]

gem "sentry-raven"

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '5.1.6'

# Use postgresql as the database for Active Record
gem 'pg', '>= 0.18', '< 2.0'

# Use Puma as the app server
gem 'puma', '3.11.2'

# Role manager
gem 'rolify', '5.2'

#Html to haml
gem 'haml'

gem 'activesupport-current_attributes'

##
# gem 'postgres_ext', git: 'https://github.com/DavyJonesLocker/postgres_ext.git', branch: 'master'

# Model Follow any other model
gem 'acts_as_follower', github: 'tcocca/acts_as_follower', branch: 'master'

# Comments for Profile and nested comments/replies
gem 'acts_as_commentable_with_threading'

# Tags for Model
gem 'acts-as-taggable-on', github: 'mbleigh/acts-as-taggable-on'

# Use Rack CORS for handling Cross-Origin Resource Sharing (CORS), making cross-origin AJAX possible
gem 'rack-cors'

#Notifications
gem 'notification-handler', '1.2.5'
# gem 'notification-pusher'
# gem 'notification-pusher-actionmailer'
gem 'notification-settings'

# Search
gem 'ransack', '~> 1.8', '>= 1.8.8'

# Geolocation
gem 'geocoder', '~> 1.4', '>= 1.4.7'

# All countries gem
gem 'city-state', '~> 0.0.13'

# Devise for authentication
gem 'devise_token_auth'
# gem 'omniauth-google-oauth2'
# gem 'omniauth-facebook'

# Decorators
gem 'draper'

# Friendly ids to route
gem 'friendly_id', '5.2.4'

# Data Faker
gem 'faker', git: 'https://github.com/stympy/faker.git', branch: 'master'

# Validate email
gem 'validates_email_format_of'

# Pagination
gem 'kaminari'
# gem 'pager_api'

# Database plugin to add soft delete.
gem 'paranoia', '~> 2.2'

# Rendering JSON responses
gem 'active_model_serializers'

# Uploaders
gem 'carrierwave'
gem 'carrierwave-base64'

# Generate tokens
gem 'has_secure_token', '~> 1.0'

# State machine - Handle state of models
gem 'aasm', '4.12.3'

group :development, :test do
  gem 'action-cable-testing'
  gem 'byebug', platforms: %i[mri mingw x64_mingw]
  gem 'factory_bot_rails'
  gem 'rspec-rails'
  # gem 'pry-rails'
  # gem 'pry-byebug'
  # gem 'pry-stack_explorer'
end

group :development do
  gem 'listen', '>= 3.0.5', '< 3.2'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'

  # Capistrano
  gem 'capistrano',         require: false
  gem 'capistrano-rvm',     require: false
  gem 'capistrano-rails',   require: false
  gem 'capistrano-bundler', require: false
  gem 'capistrano3-puma',   require: false
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]

# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
# gem 'jbuilder', '~> 2.5'
# Use Redis adapter to run Action Cable in production
gem 'redis', '~> 4.0'
# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'
# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

#---- Intranet ----
gem 'intranet', path: 'plugins/intranet'

#---- WaveCitizen ----
gem 'wave_citizen', path: 'plugins/wave_citizen'

#---- WaveEducational ----
gem 'wave_educational', path: 'plugins/wave_educational'

#---- WaveWork ----
gem 'wave_work', path: 'plugins/wave_work'
