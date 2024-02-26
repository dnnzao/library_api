require 'rails_helper'

RSpec.describe 'RegistrationsController', type: :request do
  describe 'POST /auth' do
    context 'with valid parameters' do
      let(:valid_attributes) do
        {
          user: {
            name: 'Sudo Su',
            email: 'super_user6@root.com',
            password: 'arch_superiority',
            password_confirmation: 'arch_superiority'
          },
          confirm_success_url: '/'
        }
      end

      it 'registers a new user and returns status code 201' do
        post '/auth', params: valid_attributes.to_json, headers: { 'CONTENT_TYPE' => 'application/json' }
        expect(response).to have_http_status(:success)
      end
    end

    context 'with valid parameters' do
      let(:invalid_attributes) do
        {
          user: {
            name: '',
            email: '',
            password: '',
            password_confirmation: ''
          },
          confirm_success_url: '/'
        }
      end

      it 'registers a new user and returns status code 201' do
        post '/auth', params: invalid_attributes.to_json, headers: { 'CONTENT_TYPE' => 'application/json' }
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end
end
