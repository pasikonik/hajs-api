# frozen_string_literal: true

source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.6.5'

gem 'pg', '>= 0.18', '< 2.0'
gem 'puma'
gem 'rails', '~> 6.0.0'

gem 'active_model_serializers', '~> 0.10.10'
gem 'attr_encrypted', '~> 3.1.0'
gem 'bcrypt', '~> 3.1.12'
gem 'jwt'
gem 'rack-cors', require: 'rack/cors'
gem 'simple_command'

gem 'bootsnap', '>= 1.1.0', require: false

group :development, :test do
  gem 'byebug', platforms: %i[mri mingw x64_mingw]
  gem 'factory_bot_rails'
  gem 'faker'
end

group :development do
  gem 'awesome_print'
  gem 'brakeman'
  gem 'bullet'
  gem 'capistrano', '~> 3.10',        require: false
  gem 'capistrano-bundler', '~> 1.4', require: false
  gem 'capistrano-rails', '~> 1.4',   require: false
  gem 'capistrano-rails-console',     require: false
  gem 'capistrano-rvm',               require: false
  gem 'capistrano3-puma',             require: false
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
  gem 'traceroute'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: %i[mingw mswin x64_mingw jruby]
