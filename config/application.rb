require_relative 'boot'

require 'rails'
require 'active_model/railtie'
require 'active_job/railtie'
require 'active_record/railtie'
require 'active_storage/engine'
require 'action_controller/railtie'
require 'action_mailer/railtie'
require 'action_mailbox/engine'
require 'action_text/engine'
require 'action_view/railtie'
require 'action_cable/engine'
require 'sprockets/railtie'
require_relative 'logger_custom_formatter'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module BGBL
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 6.1

    # Time zone
    config.time_zone = 'Asia/Tokyo'
    config.active_record.default_timezone = :utc

    # Logger
    logger           = ActiveSupport::Logger.new(MocaRlibs::Docker.running_on_docker? ? '/var/log/docker.container.log' : Rails.root.join('log', "#{Rails.env}.log"))
    logger.formatter = ::Logger::CustomFormatter.new
    config.logger    = ActiveSupport::TaggedLogging.new(logger)
    config.log_level = :info
    config.log_tags  = [:request_id]

    # Don't generate system test files.
    config.generators.system_tests = nil
  end
end
