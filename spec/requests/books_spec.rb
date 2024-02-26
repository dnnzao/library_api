# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Books', type: :request do
  let!(:user) { create(:user) }
  let!(:category) { create(:category) }
  let!(:publisher) { create(:publisher) }
  let!(:valid_book_attributes) { attributes_for(:book, category_id: category.id, publisher_id: publisher.id) }
  let!(:invalid_book_attributes) { attributes_for(:book, :invalid_book) }
  let!(:auth_headers) { user.create_new_auth_token }

  def login_user
    before(:all) do
      user.confirm!
      sign_in user
    end
  end

  describe 'POST /books' do
    context 'with valid parameters' do
      it 'creates a new Book' do
        post books_path, params: { book: valid_book_attributes }.to_json, headers: auth_headers.merge({'Content-Type' => 'application/json'})
        expect(response).to have_http_status(:created)
      end
    end

    context 'with invalid parameters' do
      it 'does not create a new Book' do
        post books_path, params: { book: invalid_book_attributes }.to_json, headers: auth_headers.merge({'Content-Type' => 'application/json'})
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end
end
