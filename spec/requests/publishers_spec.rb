# frozen_string_literal: true

require 'rails_helper'

RSpec.describe CategoriesController, type: :request do  
  let!(:user) { create(:user) }
  let!(:valid_publisher_attributes) { attributes_for(:publisher) }
  let!(:invalid_publisher_attributes) { attributes_for(:publisher, :invalid_publisher) }
  let!(:auth_headers) { user.create_new_auth_token }

  def login_user
    before(:all) do
      user.confirm!
      sign_in user
    end
  end

  describe 'POST /publishers' do
    context 'with valid parameters' do
      it 'creates a new Book' do
        post publishers_path, params: valid_publisher_attributes.to_json, headers: auth_headers.merge({'Content-Type' => 'application/json'})
        expect(response).to have_http_status(:created)
      end
    end

    context 'with invalid parameters' do
      it 'does not create a new Book' do
        post publishers_path, params: invalid_publisher_attributes.to_json, headers: auth_headers.merge({'Content-Type' => 'application/json'})
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end
end
