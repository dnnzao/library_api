# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Books', type: :request do
  let!(:user) { create(:user) }
  let!(:valid_book_attributes) { attributes_for(:book) }

  describe 'POST /books' do
    context 'when user is logged in' do
      it 'creates a new Book' do
        auth_headers = authenticate_user(user)
        post books_path, params: { book: valid_book_attributes }.to_json, headers: auth_headers.merge('Content-Type' => 'application/json')
        expect(response).to have_http_status(:created)
      end
    end

    # context 'with invalid parameters' do
    #   it 'does not create a new Book' do
    #     post books_path, params: invalid_book_attributes.to_json, headers: auth_headers.merge({'Content-Type' => 'application/json'})
    #     expect(response).to have_http_status(:unprocessable_entity)
    #   end
    # end
  end
end
