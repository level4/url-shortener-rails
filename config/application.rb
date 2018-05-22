require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module UrlShortener
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 5.2

    load_path_strategy = Rails.env.production? ? :eager_load_paths : :autoload_paths
    config.public_send(load_path_strategy) << Rails.root.join('lib')
    config.public_send(load_path_strategy) << Rails.root.join('serializers')

    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration can go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded after loading
    # the framework and any gems in your application.
  end
end
