# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Categories', type: :request do
  let!(:user) { create(:user) }

  describe 'POST /categories' do
    context 'when user is logged in' do
      it 'creates a new Category' do
        auth_headers = authenticate_user(user)
        category_params = { name: 'RSpec Category' }
        post categories_path, params: { category: category_params }.to_json, headers: auth_headers.merge({'Content-Type' => 'application/json'})
        expect(response).to have_http_status(:created)
      end

      it 'Category does not have valid parameters' do
        auth_headers = authenticate_user(user)
        category_params = { name: '' }
        post categories_path, params: { category: category_params }.to_json, headers: auth_headers.merge({'Content-Type' => 'application/json'})
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end

    context 'when user is logged NOT in' do
      it 'does NOT creates a new category' do
        category_params = { name: 'RSpec Category' }
        post categories_path, params: { category: category_params }.to_json
        expect(response).to have_http_status(:unauthorized)
      end
    end
  end
end
