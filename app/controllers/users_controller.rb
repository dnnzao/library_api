# frozen_string_literal: true

# Filename: /home/deniojr/Desktop/ruby_on_rails_studies/library_api/app/controllers/user_controller.rb
# Path: /home/deniojr/Desktop/ruby_on_rails_studies/library_api/app/controllers
# Created Date: Thursday, February 1st 2024, 4:02:58 pm
# Author: Dênio Barbosa Júnior

# Copyright (c) 2024 Your Company

class UsersController < ApplicationController
  before_action :authenticate_user!, only: %i[create update destroy]
  before_action :set_user, only: %i[show update destroy]

  def index
    @user = User.all
    render json: @user
  end

  def show
    render json: @user
  end

  # GET /list_users - all user data
  def list_users
    @user = User.all
    render json: @user
  end

  # POST /auth
  def create
    @user = User.new(user_params)

    puts user_params.to_sym
    if @user.save
      UserMailer.confirmation_instructions(@user).deliver_now
      render json: { message: 'Please check your email to confirm your registration.' }, status: :created
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /user/1
  def update
    if @user.update(user_params)
      render json: @user
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  # DELETE /user/1
  def destroy
    @user.destroy
    head :no_content
  end

  # POST /user/info - retrieve user information by email.
  def info
    user = User.find_by(email: params[:email])

    if user
      render json: { id: user.id, name: user.name, email: user.email }
    else
      render json: { error: 'User not found' }, status: :not_found
    end
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
end
