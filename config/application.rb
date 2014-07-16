require File.expand_path('../boot', __FILE__)

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(:default, Rails.env)

module TuxedoProto
  class Application < Rails::Application
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.

    # Set Time.zone default to the specified zone and make Active Record auto-convert to this zone.
    # Run "rake -D time" for a list of tasks for finding time zone names. Default is UTC.
    # config.time_zone = 'Central Time (US & Canada)'

    # The default locale is :en and all translations from config/locales/*.rb,yml are auto loaded.
    # config.i18n.load_path += Dir[Rails.root.join('my', 'locales', '*.{rb,yml}').to_s]
    # config.i18n.default_locale = :de

    if RUBY_PLATFORM == 'java'
      java.lang.Class.for_name('javax.crypto.JceSecurity').get_declared_field('isRestricted').tap{|f| f.accessible = true; f.set nil, false}
    end

    config.autoload_paths += %W(#{config.root}/lib)
    config.autoload_paths += %W(#{config.root}/lib/utility)
    config.i18n.enforce_available_locales = false
    config.assets.precompile += %w(*.png *.jpg *.jpeg *.gif)

    # Assets in development and test
    Bundler.require *Rails.groups(:assets => %w(development test))

    ActionDispatch::Callbacks.after do
      # Reload the factories
      return unless (Rails.env.development? || Rails.env.test?)

      unless FactoryGirl.factories.blank? # first init will load factories, this should only run on subsequent reloads
        FactoryGirl.factories.clear
        FactoryGirl.find_definitions
      end
    end
  end
end

