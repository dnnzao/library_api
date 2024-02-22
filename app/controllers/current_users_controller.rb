# frozen_string_literal: true

class CurrentUsersController < ApplicationController
  before_action :authenticate_user!

  def show
    if current_user
      render json: current_user
    else
      render json: { error: 'User not found' }, status: :not_found
    end
  end
end
