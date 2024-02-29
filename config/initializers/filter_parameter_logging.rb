# frozen_string_literal: true

#
# Filename: /home/deniojr/Desktop/ruby_on_rails_studies/library_api/config/initializers/filter_parameter_logging.rb
# Path: /home/deniojr/Desktop/ruby_on_rails_studies/library_api/config/initializers
# Created Date: Thursday, February 1st 2024, 4:02:58 pm
# Author: Dênio Barbosa Júnior
#
# Copyright (c) 2024 Your Company
#

Rails.application.config.filter_parameters += %i[
  passw secret token _key crypt salt certificate otp ssn
]
