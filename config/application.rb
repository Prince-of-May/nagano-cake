require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module NaganoCake
  class Application < Rails::Application
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.
  
  end

  Rails.application.config.active_record.sqlite3.represent_boolean_as_integer = true
  # 応急処置

  #config.time_zone = 'Asia/Tokyo'#タイムゾーンを日本時間に設定

end


