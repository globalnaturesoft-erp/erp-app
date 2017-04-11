require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module ErpSystem
  class Application < Rails::Application
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.
    config.i18n.default_locale = :vi

    config.action_view.cache_template_loading = true

    #@todo HK-ERP connector
    config.hkerp_endpoint = 'http://erp.hoangkhang.com.vn/'
  end
end
