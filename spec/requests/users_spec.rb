require 'rails_helper'

RSpec.describe "User Registrations", type: :request do
  describe "POST /auth" do # Adjust the path according to your routes
    let(:user_params) do
      {
        email: 'user@example.com',
        password: 'password123',
        password_confirmation: 'password123'
      }
    end

    it "registers a user" do
      expect {
        post user_registration_path, params: { user: user_params }
      }.to change(User, :count).by(1)
      expect(response).to have_http_status(:success)
    end
  end
end
