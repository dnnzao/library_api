# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Books', type: :request do
  let!(:user) { create(:user) }

  before(:each) do
    @category = Category.find_or_create_by(id: 5, name: 'Fantasy')
    @publisher = Publisher.find_or_create_by(id: 5, name: 'Penguin Random House')
  end

  describe 'POST /books' do
    context 'when user is logged in' do
      it 'creates a new Book' do
        auth_headers = authenticate_user(user)
        book_params = {
          book_name: 'The Factory Bot Book 2',
          author: 'Factory Bot',
          published_date: Date.current,
          category_id: @category.id,
          publisher_id: @publisher.id
        }
        post books_path, params: { book: book_params }.to_json, headers: auth_headers.merge({'Content-Type' => 'application/json'})
        expect(response).to have_http_status(:created)
      end

      it 'Books does not have valid parameters' do
        auth_headers = authenticate_user(user)
        book_params = {
          book_name: '',
          author: '',
          published_date: nil,
          category_id: nil,
          publisher_id: nil
        }
        post books_path, params: { book: book_params }.to_json, headers: auth_headers.merge({'Content-Type' => 'application/json'})
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end

    context 'when user is logged NOT in' do
      it 'does NOT creates a new Book' do
        book_params = {
          book_name: 'The Factory Bot Book 2',
          author: 'Factory Bot',
          published_date: Date.current,
          category_id: @category.id,
          publisher_id: @publisher.id
        }
        post books_path, params: { book: book_params }.to_json
        expect(response).to have_http_status(:unauthorized)
      end
    end
  end
end
