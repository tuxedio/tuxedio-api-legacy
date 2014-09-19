require 'rubygems'
require 'spork'

Spork.prefork do
  ENV["RAILS_ENV"] ||= 'test'

  require File.expand_path("../../config/environment", __FILE__)
  require 'rspec/rails'
  require 'capybara/rspec'

  Dir[Rails.root.join("spec/support/**/*.rb")].each {|f| require f}

  ActiveRecord::Migration.maintain_test_schema!
  ActiveRecord::Migration.check_pending! if defined?(ActiveRecord::Migration)

  RSpec.configure do |config|
    config.include Capybara::DSL
    config.include Devise::TestHelpers, type: :controller
    config.include FactoryGirl::Syntax::Methods
    config.include Requests::JsonHelpers, type: :request

    config.use_transactional_fixtures = true
    config.infer_base_class_for_anonymous_controllers = false
    config.order = "random"
    config.infer_spec_type_from_file_location!
  end
end
