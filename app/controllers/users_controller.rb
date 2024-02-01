class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]

  def index
    @users = User.all
  end

  def show
    if @users
      render json: @users
    else
      render json: { error: 'Book not found' }, status: :not_found
    end
  end

  def new
    @users = User.new
  end

  def create
    @users = User.new(user_params)
    if @users.save
      redirect_to @users, notice: 'User was successfully created.'
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @users.update(user_params)
      redirect_to @users, notice: 'User was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @users.destroy
    redirect_to users_url, notice: 'User was successfully destroyed.'
  end

  private

  def set_user
    @users = User.find(params[:id])
  end

  def user_params
    # Define the permitted parameters for user creation and update here.
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
end
