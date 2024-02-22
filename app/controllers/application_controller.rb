# frozen_string_literal: true

#
# Filename: /home/deniojr/Desktop/ruby_on_rails_studies/library_api/app/controllers/application_controller.rb
# Path: /home/deniojr/Desktop/ruby_on_rails_studies/library_api/app/controllers
# Created Date: Thursday, February 1st 2024, 4:02:58 pm
# Author: Dênio Barbosa Júnior
#
# Copyright (c) 2024 Your Company
#

class ApplicationController < ActionController::API
  include DeviseTokenAuth::Concerns::SetUserByToken
end
