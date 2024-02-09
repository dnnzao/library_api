require 'rails_helper'

RSpec.describe "Books", type: :request do
  let(:user) { FactoryBot.create(:user) }
  let(:auth_headers) { user.create_new_auth_token }
  let(:category) { FactoryBot.create(:category) }
  let(:publisher) { FactoryBot.create(:publisher) }
  let(:book) { FactoryBot.create(:book, category: category, publisher: publisher) }
  
  let(:valid_attributes) {
    {
      book_name: "Updated Factory Bot Book",
      author: "Updated Factory Bot",
      published_date: Date.current,
      category_id: category.id,
      publisher_id: publisher.id
    }
  }
  
  let(:invalid_attributes) {
    {
      book_name: "",
      author: nil,
      published_date: nil,
      category_id: nil,
      publisher_id: nil
    }
  }

  describe "POST /books" do
    context "when user is logged in" do
      it "creates a new Book with valid parameters" do
        expect {
          post books_path, params: { book: valid_attributes }, headers: auth_headers
        }.to change(Book, :count).by(1)
        expect(response).to have_http_status(:created)
      end

      it "does not create a new Book with invalid parameters" do
        expect {
          post books_path, params: { book: invalid_attributes }, headers: auth_headers
        }.to_not change(Book, :count)
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end

    context "when user is logged out" do
      it "does not allow creating a Book" do
        post books_path, params: { book: valid_attributes }
        expect(response).to have_http_status(:unauthorized)
      end
    end
  end

  describe "PUT /books/:id" do
    context "when user is logged in" do
      it "updates the Book with valid parameters" do
        put book_path(book), params: { book: valid_attributes }, headers: auth_headers
        book.reload
        expect(book.book_name).to eq(valid_attributes[:book_name])
        expect(response).to have_http_status(:ok)
      end

      it "does not update the Book with invalid parameters" do
        put book_path(book), params: { book: invalid_attributes }, headers: auth_headers
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end

    context "when user is logged out" do
      it "does not allow updating a Book" do
        put book_path(book), params: { book: valid_attributes }
        expect(response).to have_http_status(:unauthorized)
      end
    end
  end

  describe "DELETE /books/:id" do
    let!(:book_to_delete) { FactoryBot.create(:book, category: category, publisher: publisher) }
    
    context "when user is logged in" do
      it "deletes the Book" do
        expect {
          delete book_path(book_to_delete), headers: auth_headers
        }.to change(Book, :count).by(-1)
        expect(response).to have_http_status(:no_content)
      end
    end

    context "when user is logged out" do
      it "does not allow deleting a Book" do
        delete book_path(book_to_delete)
        expect(response).to have_http_status(:unauthorized)
      end
    end
  end
end
