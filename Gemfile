source 'https://rubygems.org'
ruby "2.3.1"
git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end


# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 5.1.5'
# Use postgresql as the database for Active Record
gem 'pg', '>= 0.18', '< 2.0'
# Use Puma as the app server
gem 'puma', '~> 3.7'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
# gem 'jbuilder', '~> 2.5'
# Use Redis adapter to run Action Cable in production
# gem 'redis', '~> 4.0'
# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'
gem 'acts-as-taggable-on', github: 'mbleigh/acts-as-taggable-on'
# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

#Use Rack CORS for handling Cross-Origin Resource Sharing (CORS), making cross-origin AJAX possible
gem 'rack-cors'

#devise
gem 'devise_token_auth'
gem 'omniauth'

#Model Follow any other model
gem 'acts_as_follower', github: 'tcocca/acts_as_follower', branch: 'master'


#Database plugin to add soft delete.
gem "paranoia", "~> 2.2"

#Rendering JSON responses
gem 'active_model_serializers'

#Uploaders
gem 'carrierwave'

group :development, :test do
  gem 'rspec-rails'
  gem 'factory_bot_rails'
  # gem 'pry-rails'
  # gem 'pry-byebug'
  # gem 'pry-stack_explorer'
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
end

group :development do
  gem 'listen', '>= 3.0.5', '< 3.2'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
