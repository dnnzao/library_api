# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Publishers', type: :request do
  let!(:user) { create(:user) }

  describe 'POST /publishers' do
    context 'when user is logged in' do
      it 'creates a new Publisher' do
        auth_headers = authenticate_user(user)
        publisher_params = { name: 'RSpec Publisher' }
        post publishers_path, params: { publisher: publisher_params }.to_json, headers: auth_headers.merge({'Content-Type' => 'application/json'})
        expect(response).to have_http_status(:created)
      end

      it 'Publisher does not have valid parameters' do
        auth_headers = authenticate_user(user)
        publisher_params = { name: '' }
        post publishers_path, params: { publisher: publisher_params }.to_json, headers: auth_headers.merge({'Content-Type' => 'application/json'})
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end

    context 'when user is logged NOT in' do
      it 'does NOT creates a new publisher' do
        publisher_params = { name: 'RSpec Publisher' }
        post publishers_path, params: { publisher: publisher_params }.to_json
        expect(response).to have_http_status(:unauthorized)
      end
    end
  end
end
