# frozen_string_literal: true

#
# Filename: /home/deniojr/Desktop/ruby_on_rails_studies/library_api/app/controllers/registrations_controller.rb
# Path: /home/deniojr/Desktop/ruby_on_rails_studies/library_api/app/controllers
# Created Date: Thursday, February 1st 2024, 4:02:58 pm
# Author: Dênio Barbosa Júnior
#
# Copyright (c) 2024 Your Company
#

class RegistrationsController < DeviseTokenAuth::RegistrationsController
  before_action :validate_signup_params, only: [:create]

  private

  def validate_signup_params
    required_params = %i[name email password password_confirmation]
    required_params.each do |param|
      if params[:user][param].blank?
        render json: { error: "#{param.capitalize} can't be blank" }, status: :unprocessable_entity
        return
      end
    end

    unless params[:user][:password] == params[:user][:password_confirmation]
      render json: { error: "Password confirmation doesn't match Password" }, status: :unprocessable_entity
      return
    end
  end

  def sign_up_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end

  def account_update_params
    params.require(:user).permit(:name, :email)
  end
end
