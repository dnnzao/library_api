#
# Filename: /home/deniojr/Desktop/ruby_on_rails_studies/library_api/config/initializers/devise_token_auth.rb
# Path: /home/deniojr/Desktop/ruby_on_rails_studies/library_api/config/initializers
# Created Date: Thursday, February 1st 2024, 4:02:58 pm
# Author: Dênio Barbosa Júnior
#
# Copyright (c) 2024 Your Company
#

# frozen_string_literal: true

DeviseTokenAuth.setup do |config|
  config.token_cost = Rails.env.test? ? 4 : 10

  config.enable_standard_devise_support = true

  config.send_confirmation_email = true
end
