# frozen_string_literal: true

#
# Filename: /home/deniojr/Desktop/ruby_on_rails_studies/library_api/app/mailers/application_mailer.rb
# Path: /home/deniojr/Desktop/ruby_on_rails_studies/library_api/app/mailers
# Created Date: Monday, February 5th 2024, 3:09:13 pm
# Author: Dênio Barbosa Júnior
#
# Copyright (c) 2024 Your Company
#

class ApplicationMailer < ActionMailer::Base
  default from: 'example@email.com'
  layout 'mailer'
end
