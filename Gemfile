source 'https://rubygems.org'

gem  'rails'

platform :jruby do
  gem 'jruby-openssl'
  gem 'activerecord-jdbcpostgresql-adapter'
  gem 'torqbox'
end

platform :ruby do
  gem 'binding_of_caller', group: :development
  gem 'pg'
  gem 'pry-byebug', github: 'deivid-rodriguez/pry-byebug'
  gem 'spring', group: :development
  gem 'spring-commands-rspec', group: :development
  gem 'thin'
end

group :development, :test do
  gem 'deepstruct'
  gem 'pry-rails'
  gem 'rake'
  gem 'rspec-rails'
  gem 'sprockets'
  gem 'sprockets-rails', :require => 'sprockets/railtie'
end

group :development do
  gem 'better_errors'
  gem 'guard-bundler'
  gem 'guard-rails'
  gem 'guard-rspec'
end

group :test do
  gem 'database_cleaner', github: 'bmabey/database_cleaner'
end

group :doc do
  gem 'sdoc', '0.3.20', require: false
end

group :production do
  gem 'rails_12factor', '0.0.2'
end

gem 'roar-rails'
gem 'bcrypt-ruby', '3.1.2'
gem 'open_uri_redirections'
gem 'childprocess', '0.3.6'
gem 'devise'
gem 'omniauth-facebook'
gem 'factory_girl_rails', github: 'thoughtbot/factory_girl_rails'
gem 'faker'
gem 'jc-validates_timeliness'
gem 'oauth-plugin'
gem 'paperclip', '~> 4.1'
gem 'protected_attributes', '1.0.7'
gem 'devise_token_auth', github: 'lynndylanhurley/devise_token_auth'
