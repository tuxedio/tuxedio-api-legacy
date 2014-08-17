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
  gem 'spring-commands-cucumber', group: :development
  gem 'spring-commands-rspec', group: :development
end

group :development, :test do
  gem 'pry-rails'
  gem 'sprockets'
  gem 'sprockets-rails', :require => 'sprockets/railtie'
end

group :development do
  gem 'guard-cucumber', require: false
  gem 'guard-livereload', require: false
  gem 'guard-rspec', require: false
end


group :test do
  gem 'capybara'
  gem 'colorize'
  gem 'cucumber-rails', '1.4.0', require: false
  gem 'database_cleaner', github: 'bmabey/database_cleaner'
  gem 'growl', '1.0.3'
  gem 'rake'
  gem 'rspec-rails', '~> 2.99'
  gem 'selenium-webdriver', '2.35.1'
  gem 'simplecov', '~> 0.7.1', require: false
  gem 'spork-rails'
  gem 'pickle'
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
  gem 'sass-rails', '~> 4.0.0'
  gem 'uglifier'
end

gem 'bcrypt-ruby', '3.1.2'
gem 'bootstrap_form'
gem 'childprocess', '0.3.6'
gem 'devise'
gem 'factory_girl_rails', '4.2.1'
gem 'faker', '1.3.0'
gem 'haml'
gem 'haml-rails'
gem 'jbuilder', '1.0.2'
gem 'jc-validates_timeliness'
gem 'jquery-rails'
gem 'oauth-plugin'
gem 'paperclip', '~> 4.1'
gem 'protected_attributes', '1.0.7'
gem 'turbolinks', '1.1.1'
gem 'will_paginate', '3.0.5'
gem 'will_paginate-bootstrap', '1.0.0'
