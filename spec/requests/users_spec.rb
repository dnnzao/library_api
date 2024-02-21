require 'rails_helper'
require 'faker'

RSpec.describe "User Methods", type: :request do
    let!(:auth_headers) { @current_user = FactoryBot.create(:user) }
    let(:invalid_attributes) { 
      { 
        name: "The Factory Bot Book",
        email: "",
        password: "1234567",
        password_confirmation: ""
      }
    } 

    it "registers a user with valid parameters" do
      expect {have_http_status.to eq(200)}
    end

    it "registers a user with invalid parameters" do
      expect {have_http_status.to eq(400)}
    end
end
