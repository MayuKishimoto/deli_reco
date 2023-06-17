require_relative "boot"

require "rails/all"

Bundler.require(*Rails.groups)

module DeliReco
  class Application < Rails::Application
    config.time_zone = 'Tokyo'
    config.active_record.default_timezone = :local
    config.load_defaults 6.1
    config.generators do |g|
      g.test_framework :rspec,
                        fixtures: true,
                        view_specs: false,
                        helper_specs: false,
                        routing_specs: false,
                        controller_specs: false,
                        request_specs: false
      g.fixture_replacement :factory_bot, dir: "spec/factories"
    end
  end
end
