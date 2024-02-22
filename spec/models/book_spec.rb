# frozen_string_literal: true

require 'rails_helper'

RSpec.describe BooksController, type: :request do
  let(:user) { FactoryBot.create(:user) }
  let(:valid_attributes) do
    { book_name: 'The Great Gatsby', author: 'F. Scott Fitzgerald', published_date: Date.current, category_id: 1,
      publisher_id: 1 }
  end
  let(:invalid_attributes) do
    { book_name: '', author: '', published_date: nil, category_id: nil, publisher_id: nil }
  end

  # CREATE test
  describe 'POST /books' do
    context 'when user is logged in' do
      before { sign_in user }

      context 'with valid parameters' do
        it 'creates a new book and returns status code 201' do
          post books_path, params: { book: valid_attributes },
                           headers: { Authorization: "Bearer #{user.auth_token}" }
          expect(response).to have_http_status(201)
          expect(response.content_type).to match(a_string_including('application/json'))
        end
      end

      context 'with invalid parameters' do
        it 'does not create a new book and returns status code 422' do
          post books_path, params: { book: invalid_attributes },
                           headers: { Authorization: "Bearer #{user.auth_token}" }
          expect(response).to have_http_status(422)
          expect(response.content_type).to match(a_string_including('application/json'))
        end
      end
    end

    context 'when user is logged out' do
      it 'does not create a book and returns status code 401' do
        post books_path, params: { book: valid_attributes }
        expect(response).to have_http_status(401)
      end
    end
  end

  # UPDATE test
  describe 'PUT /books/:id' do
    let!(:book) { FactoryBot.create(:book) } # Create a book to update

    context 'when user is logged in' do
      before { sign_in user }

      context 'with valid parameters' do
        let(:new_attributes) do
          { book_name: 'Updated Book Name', author: 'Updated Author' }
        end

        it 'updates the book and returns status code 200' do
          put book_path(book), params: { book: new_attributes },
                               headers: { Authorization: "Bearer #{user.auth_token}" }
          book.reload # Reload the book from the database to get the updated attributes
          expect(response).to have_http_status(200)
          expect(book.book_name).to eq(new_attributes[:book_name])
          expect(book.author).to eq(new_attributes[:author])
        end
      end

      context 'with invalid parameters' do
        it 'does not update the book and returns status code 422' do
          put book_path(book), params: { book: invalid_attributes },
                               headers: { Authorization: "Bearer #{user.auth_token}" }
          expect(response).to have_http_status(422)
        end
      end
    end

    context 'when user is logged out' do
      it 'does not update the book and returns status code 401' do
        put book_path(book), params: { book: valid_attributes }
        expect(response).to have_http_status(401)
      end
    end
  end

  # DELETE test
  describe 'DELETE /books/:id' do
    let!(:book) { FactoryBot.create(:book) } # Create a book to delete

    context 'when user is logged in' do
      before { sign_in user }

      it 'deletes the book and returns status code 204' do
        expect do
          delete book_path(book), headers: { Authorization: "Bearer #{user.auth_token}" }
        end.to change(Book, :count).by(-1)
        expect(response).to have_http_status(204) # 204 No Content is often used for successful deletes
      end
    end

    context 'when user is logged out' do
      it 'does not delete the book and returns status code 401' do
        delete book_path(book)
        expect(response).to have_http_status(401)
      end
    end
  end
end
