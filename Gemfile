source 'https://rubygems.org'
source 'http://torquebox.org/4x/builds/gem-repo/'
TORQUEBOX_VERSION = '4.x.incremental.173'

ruby '2.0.0'

gem  'rails', '4.1.4'

platform :jruby do
  gem 'jruby-openssl'
  gem 'activerecord-jdbcpostgresql-adapter'
  gem 'torquebox', TORQUEBOX_VERSION
  gem 'spork', '~> 1.0rc'
end

platform :ruby do
  gem 'pg'
  gem 'debugger'
  gem 'thin', group: :development
end


group :development, :test do
  gem 'childprocess', '0.3.6'
  gem 'factory_girl_rails', '4.2.1'
  gem 'pry-rails'
  gem 'sprockets'
  gem 'sprockets-rails', :require => 'sprockets/railtie'
end

group :development do
  gem 'capistrano', '~> 3.1.0'
  gem 'capistrano-bundler', '~> 1.1.2'
  gem 'capistrano-rails', '~> 1.1.1'
  gem 'capistrano-rvm', github: "capistrano/rvm"
  gem 'guard-cucumber', require: false
  gem 'guard-livereload', require: false
  gem 'guard-rspec', require: false
  gem 'spring'
  gem 'spring-commands-cucumber'
  gem 'spring-commands-rspec'
end


group :test do
  gem 'capybara'
  gem 'colorize'
  gem 'cucumber-rails', '1.4.0', :require => false
  gem 'database_cleaner', github: 'bmabey/database_cleaner'
  gem 'growl', '1.0.3'
  gem 'rake'
  gem 'rspec-rails', '~> 2.99'
  gem 'selenium-webdriver', '2.35.1'
  gem 'simplecov', '~> 0.7.1', :require => false
  gem 'spork-rails'
  gem 'pickle', github: "tuxedio/pickle"
  gem 'launchy'
end

group :doc do
  gem 'sdoc', '0.3.20', require: false
end

group :production do
  gem 'rails_12factor', '0.0.2'
end

group :assets do
  gem 'bootstrap-sass'
  gem 'coffee-rails'
  gem 'jquery-rails'
  gem 'sass-rails', '~> 4.0.0'
  gem 'uglifier'
end


gem 'bcrypt-ruby', '3.1.2'
gem 'bootstrap_form'
gem 'devise'
gem 'faker', '1.3.0'
gem 'haml'
gem 'haml-rails'
gem 'jbuilder', '1.0.2'
gem 'oauth-plugin'
gem 'paperclip', '~> 4.1'
gem 'protected_attributes', '1.0.7'
gem 'turbolinks', '1.1.1'
gem 'validates_timeliness', github: 'johncarney/validates_timeliness', branch: 'remove-deprecated-setup-method'
gem 'will_paginate', '3.0.5'
gem 'will_paginate-bootstrap', '1.0.0'
