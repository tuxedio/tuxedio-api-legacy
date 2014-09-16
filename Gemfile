source 'https://rubygems.org'

ruby '2.0.0'
gem  'rails', '4.1.4'

platform :jruby do
  gem 'jruby-openssl'
  gem 'activerecord-jdbcpostgresql-adapter'
  gem 'torqbox'
  gem 'spork', '~> 1.0rc', group: :development
end

platform :ruby do
  gem 'pg'
  gem 'thin'
  gem 'pry-byebug'
  gem 'spring', group: :development
  gem 'spring-commands-rspec', group: :development
end

group :development, :test do
  gem 'pry-rails'
  gem 'sprockets'
  gem 'sprockets-rails', :require => 'sprockets/railtie'
end

group :development do
  gem 'guard-rspec', require: false
end


group :test do
  gem 'capybara'
  gem 'colorize'
  gem 'database_cleaner', github: 'bmabey/database_cleaner'
  gem 'growl', '1.0.3'
  gem 'rake'
  gem 'rspec-rails', '~> 2.99'
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
gem 'factory_girl_rails', '4.2.1'
gem 'faker', '1.3.0'
gem 'jbuilder', '1.0.2'
gem 'jc-validates_timeliness'
gem 'oauth-plugin'
gem 'paperclip', '~> 4.1'
gem 'protected_attributes', '1.0.7'
