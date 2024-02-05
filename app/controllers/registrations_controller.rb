# app/controllers/registrations_controller.rb

class RegistrationsController < DeviseTokenAuth::RegistrationsController

  def sign_up_params
    user_params = params.require(:user).permit(:name, :email, :password, :password_confirmation)
    user_params.merge(provider: user_params[:email], uid: user_params[:email])
  end

  def account_update_params
    params.require(:user).permit(:email)
  end

  def index
    @users = User.all
  end

  def show
    @users = User.all
  end

  def create
    @user = User.new(sign_up_params)
    if @user.save
      ApplicationMailer.confirmation_email(@user).deliver_now
      render json: { status: 'success', data: @user.as_json }, status: :ok
    else
      render json: { status: 'error', errors: @user.errors.full_messages }, status: :unprocessable_entity
    end
  end
  
end
