# frozen_string_literal: true

# Filename: /home/deniojr/Desktop/ruby_on_rails_studies/library_api/app/controllers/users_controller.rb
# Path: /home/deniojr/Desktop/ruby_on_rails_studies/library_api/app/controllers
# Created Date: Thursday, February 1st 2024, 4:02:58 pm
# Author: Dênio Barbosa Júnior

# Copyright (c) 2024 Your Company

class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_user, only: %i[show update destroy]

  def index
    @users = User.all
    render json: @users
  end

  def show
    render json: @user
  end

  # GET /list_users - all user data
  def list_users
    @users = User.all
    render json: @users
  end

  # POST /auth
  def create
    @user = User.new(user_params)

    if 
      puts user_params.to_sym
      if @user.save
        UserMailer.confirmation_instructions(@user).deliver_now
        render json: { message: 'Please check your email to confirm your registration.' }, status: :created
      end
      render json: { message: 'Could not send confirmation email.' }
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /users/1
  def update
    if @user.update(user_params)
      render json: @user
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  # DELETE /users/1
  def destroy
    @user.destroy
    head :no_content
  end

  # POST /users/info - posts user: name, email, password.
  def info
    users_info = User.all.map do |_user|
      user_params.transform_keys(&:to_sym).slice(:name, :email, :password, :password_confirmation)
    end
    render json: users_info
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
end
