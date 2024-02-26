require 'rails_helper'

RSpec.describe RegistrationsController, type: :controller do
  describe "POST /auth" do
    context 'with valid parameters' do
      it 'is valid with valid attributes' do
        @user = build(:user)
        expect(@user).to be_valid
      end
    end
  end

  context 'with invalid parameters' do
    it 'does not create a new user' do
      @user = build(:user, :invalid_user)
      expect(@user).to_not be_valid
    end
  end
end