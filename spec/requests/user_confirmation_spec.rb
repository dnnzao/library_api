# frozen_string_literal: true

require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  describe 'User confirmation' do
    it 'confirms the user' do
      user = FactoryBot.create(:user)
      get user_confirmation_url(confirmation_token: user.confirmation_token)

      expect(response).to redirect_to(some_success_path)
      user.reload
      expect(user.confirmed?).to be true
    end
  end
end
