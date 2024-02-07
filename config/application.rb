#
#Filename: /home/deniojr/Desktop/ruby_on_rails_studies/library_api/config/application.rb
#Path: /home/deniojr/Desktop/ruby_on_rails_studies/library_api/config
#Created Date: Thursday, February 1st 2024, 4:02:58 pm
#Author: Dênio Barbosa Júnior
#
#Copyright (c) 2024 Your Company
#


require_relative "boot"

require "rails/all"

Bundler.require(*Rails.groups)

module Books
  class Application < Rails::Application
    config.load_defaults 7.1

    config.autoload_lib(ignore: %w(assets tasks))
    config.api_only = true

    # Cookies and middleware due to application config.being api_only = true
    config.session_store :cookie_store, key: '_library_api'
    config.middleware.use ActionDispatch::Cookies
    config.middleware.use ActionDispatch::Session::CookieStore

    config.middleware.use config.session_store, config.session_options
  end
end
