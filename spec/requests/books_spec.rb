# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Books', type: :request do
  let!(:user) { create(:user) }

  describe 'POST /books' do
    context 'when user is logged in' do
      let(:valid_attributes) do {
        book_name: 'The Factory Bot Book 2',
        author: 'Factory Bot',
        published_date: '2024-02-28',
        category_id: 5,
        publisher_id: 5
      }
      end

      it 'creates a new Book' do
        auth_headers = authenticate_user(user)
        post books_path, params: { book: valid_attributes }.to_json, headers: auth_headers.merge('Content-Type' => 'application/json')
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
