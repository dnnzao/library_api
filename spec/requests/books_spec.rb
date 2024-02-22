# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Books', type: :request do
  let(@user) { FactoryBot.create(:user) }
  let(@category) { FactoryBot.create(:category) }
  let(@publisher) { FactoryBot.create(:publisher) }
  let(@ininvalid_attributes) do
    {
      book_name: 'The Factory Bot Book',
      author: 'Factory Bot'
    }
  end
  let(@headers) { { 'Authorization' => "Bearer #{user.auth_tokens['access']}" } }

  describe 'POST /books' do
    context 'when user is logged in' do
      before do
        sign_in user
      end

      # did not pass
      context 'with valid parameters' do
        it 'creates a new Book' do
          expect do
            post books_path, params: { book: invalid_attributes }, headers:
          end.to change(Book, :count).by(1)
          expect(response).to have_http_status(:created)
        end
      end

      # did not pass
      context 'with invalid parameters' do
        it 'does not create a new Book' do
          expect do
            post books_path, params: { book: ininvalid_attributes }, headers: # Include headers for authentication
          end.to change(Book, :count).by(0)
          expect(response).to have_http_status(:unprocessable_entity)
        end
      end
    end

    # passed
    context 'when user is logged out' do
      it 'does not allow creating a Book' do
        post books_path, params: { book: invalid_attributes }
        expect(response).to have_http_status(:unauthorized) # Assuming your API requires authentication
      end
    end
  end

  describe 'PUT /books/:id' do
    context 'when user is logged in' do
      # did not pass
      it 'updates the Book with valid parameters' do
        put book_path(book), params: { book: invalid_attributes }, headers: auth_headers
        book.reload
        expect(book.book_name).to eq(invalid_attributes[:book_name])
        expect(response).to have_http_status(:ok)
      end

      # did not pass
      it 'does not update the Book with invalid parameters' do
        put book_path(book), params: { book: ininvalid_attributes }, headers: auth_headers
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end

    context 'when user is logged out' do
      # did not pass
      it 'does not allow updating a Book' do
        put book_path(book), params: { book: invalid_attributes }
        expect(response).to have_http_status(:unauthorized)
      end
    end
  end

  describe 'DELETE /books/:id' do
    let!(:book_to_delete) { FactoryBot.create(:book, category:, publisher:) }

    context 'when user is logged in' do
      # did not pass
      it 'deletes the Book' do
        expect do
          delete book_path(book_to_delete), headers: auth_headers
        end.to change(Book, :count).by(-1)
        expect(response).to have_http_status(:no_content)
      end
    end

    context 'when user is logged out' do
      it 'does not allow deleting a Book' do
        delete book_path(book_to_delete)
        expect(response).to have_http_status(:unauthorized)
      end
    end
  end
end
