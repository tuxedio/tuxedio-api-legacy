source 'https://rubygems.org'

gem  'rails', '4.1.5'

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
  gem 'better_errors'
  gem 'pry-rails'
  gem 'sprockets'
  gem 'sprockets-rails', :require => 'sprockets/railtie'
end

group :development do
  gem 'guard-bundler'
  gem 'guard-rails'
  gem 'guard-rspec'
end


group :test do
  gem 'capybara'
  gem 'colorize'
  gem 'database_cleaner', github: 'bmabey/database_cleaner'
  gem 'growl', '1.0.3'
  gem 'rake'
  gem 'rspec-rails'
  gem 'spork-rails'
end

group :doc do
  gem 'sdoc', '0.3.20', require: false
end

group :production do
  gem 'rails_12factor', '0.0.2'
end

gem 'active_model_serializers'
gem 'bcrypt-ruby', '3.1.2'
gem 'open_uri_redirections'
gem 'childprocess', '0.3.6'
gem 'devise'
gem 'omniauth-facebook'
gem 'factory_girl_rails', github: 'thoughtbot/factory_girl_rails'
gem 'faker'
gem 'jbuilder', '1.0.2'
gem 'jc-validates_timeliness'
gem 'oauth-plugin'
gem 'paperclip', '~> 4.1'
gem 'protected_attributes', '1.0.7'
