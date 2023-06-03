require_relative "boot"

require "rails/all"

Bundler.require(*Rails.groups)

module DeliReco
  class Application < Rails::Application
    config.time_zone = 'Tokyo'
    config.active_record.default_timezone = :local
    config.load_defaults 6.1
  end
end
