#
#Filename: /home/deniojr/Desktop/ruby_on_rails_studies/library_api/app/mailers/user_mailer.rb
#Path: /home/deniojr/Desktop/ruby_on_rails_studies/library_api/app/mailers
#Created Date: Thursday, February 1st 2024, 4:02:58 pm
#Author: Dênio Barbosa Júnior
#
#Copyright (c) 2024 Your Company
#


class UserMailer < ApplicationMailer

  def welcome_email(user) 
    @user = user
    mail(to: @user.email, subject: 'Welcome to My API')
  end

  def confirmation_instructions(user)
    @user = user
    @url  = 'http://localhost:3000/confirmation_instructions'
    mail(to: @user.email, subject: 'Registration Confirmation')
  end
end

