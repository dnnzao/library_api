# frozen_string_literal: true

#
# Filename: /home/deniojr/Desktop/ruby_on_rails_studies/library_api/config/environments/development.rb
# Path: /home/deniojr/Desktop/ruby_on_rails_studies/library_api/config/environments
# Created Date: Thursday, February 1st 2024, 4:02:58 pm
# Author: Dênio Barbosa Júnior
#
# Copyright (c) 2024 Your Company
#

require 'active_support/core_ext/integer/time'

Rails.application.configure do
  # ...
  config.action_mailer.default_url_options = { host: 'localhost', port: 3000 }

  config.action_mailer.delivery_method = :smtp
  config.action_mailer.smtp_settings = {
    address: 'localhost',
    port: 1025
  }

  config.auth_redirect_url = 'http://localhost:3000/auth/success'

  config.log_level = :debug

  config.enable_reloading = true

  config.eager_load = false

  config.consider_all_requests_local = true

  config.server_timing = true

  if Rails.root.join('tmp/caching-dev.txt').exist?
    config.cache_store = :memory_store
    config.public_file_server.headers = {
      'Cache-Control' => "public, max-age=#{2.days.to_i}"
    }
  else
    config.action_controller.perform_caching = false
    config.cache_store = :null_store
  end

  config.active_storage.service = :local

  config.action_mailer.raise_delivery_errors = true

  config.action_mailer.perform_caching = false

  config.action_mailer.perform_deliveries = true

  config.active_support.deprecation = :log

  config.active_support.disallowed_deprecation = :raise

  config.active_support.disallowed_deprecation_warnings = []

  config.active_record.migration_error = :page_load

  config.active_record.verbose_query_logs = true

  config.active_job.verbose_enqueue_logs = true

  config.action_controller.raise_on_missing_callback_actions = true

  config.action_mailer.default_options = { from: 'deniojr@gmail.com' }

  config.hosts.clear
  Rails.application.config.session_store :cookie_store, key: '_library_api'
end
