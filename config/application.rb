require_relative 'boot'


require 'csv'

require 'rails/all'


# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module ITops
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 5.1

    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.
    # i18n 修改成中文
    config.i18n.default_locale = 'zh-CN'
    config.active_record.default_timezone = :local
    config.time_zone = 'Beijing'   
  end
end
