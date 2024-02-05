#
#Filename: /home/deniojr/Desktop/ruby_on_rails_studies/library_api/app/controllers/registrations_controller.rb
#Path: /home/deniojr/Desktop/ruby_on_rails_studies/library_api/app/controllers
#Created Date: Thursday, February 1st 2024, 4:02:58 pm
#Author: Dênio Barbosa Júnior
#
#Copyright (c) 2024 Your Company
#


class RegistrationsController < DeviseTokenAuth::RegistrationsController
  private

  def sign_up_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end

  def account_update_params
    params.require(:user).permit(:name, :email)
  end
end
