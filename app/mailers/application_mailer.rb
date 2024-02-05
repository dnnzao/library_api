#
#Filename: /home/deniojr/Desktop/ruby_on_rails_studies/library_api/app/mailers/application_mailer.rb
#Path: /home/deniojr/Desktop/ruby_on_rails_studies/library_api/app/mailers
#Created Date: Thursday, February 1st 2024, 4:02:58 pm
#Author: Dênio Barbosa Júnior
#
#Copyright (c) 2024 Your Company
#


class ApplicationMailer < ActionMailer::Base
  default from: 'deniojr@gmail.com'

  def confirmation_email
    mail(to: 'deniojr@gmail.com', subject: 'Test Email')
  end

  def confirmation_email(user)
    @user = user
    mail(to: @user.email, subject: 'Confirmation Email')
  end
end
