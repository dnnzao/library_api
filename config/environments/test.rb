# frozen_string_literal: true

#
# Filename: /home/deniojr/Desktop/ruby_on_rails_studies/library_api/config/environments/test.rb
# Path: /home/deniojr/Desktop/ruby_on_rails_studies/library_api/config/environments
# Created Date: Thursday, February 1st 2024, 4:02:58 pm
# Author: Dênio Barbosa Júnior
#
# Copyright (c) 2024 Your Company
#

require 'active_support/core_ext/integer/time'

Rails.application.configure do
  config.action_mailer.default_url_options = { host: 'www.example.com' }
  config.action_mailer.default_options = { from: 'deniojr@gmail.com' }
  config.action_mailer.delivery_method = :smtp
  config.action_mailer.smtp_settings = {
    address: 'localhost',
    port: 1025
  }

  config.enable_reloading = false

  config.eager_load = ENV['CI'].present?

  config.public_file_server.enabled = true
  config.public_file_server.headers = {
    'Cache-Control' => "public, max-age=#{1.hour.to_i}"
  }

  config.consider_all_requests_local = true
  config.action_controller.perform_caching = false
  config.cache_store = :null_store

  config.action_dispatch.show_exceptions = :rescuable

  config.action_controller.allow_forgery_protection = false

  config.active_storage.service = :test

  config.action_mailer.perform_caching = false

  config.action_mailer.delivery_method = :test

  config.active_support.deprecation = :stderr

  config.active_support.disallowed_deprecation = :raise

  config.active_support.disallowed_deprecation_warnings = []

  config.action_controller.raise_on_missing_callback_actions = true
end
