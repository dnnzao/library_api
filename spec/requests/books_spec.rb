require 'rails_helper'

RSpec.describe "Books", type: :request do
    let(:user) { User.find_by(email: "johnny_cage@email.com") }
    let(:category) { FactoryBot.create(:category) }
    let(:publisher) { FactoryBot.create(:publisher) }
    let(:valid_attributes) { 
      { 
        book_name: "The Factory Bot Book",
        author: "Factory Bot",
        published_date: Date.current,
        category_id: category.id,
        publisher_id: publisher.id
      }
    }   
    let(:headers) { { "Authorization" => "Bearer #{user.auth_tokens["access"]}" } }
  
    describe "POST /books" do
      context "when user is logged in" do
        before do
          sign_in user
        end
        
        # did not pass
        context "with valid parameters" do
          it "creates a new Book" do
            expect {
              post books_path, params: { book: valid_attributes }, headers: headers 
            }.to change(Book, :count).by(1)
            expect(response).to have_http_status(:created)
          end
        end
  
        # did not pass
        context "with invalid parameters" do
          it "does not create a new Book" do
            expect {
              post books_path, params: { book: invalid_attributes }, headers: headers # Include headers for authentication
            }.to change(Book, :count).by(0)
            expect(response).to have_http_status(:unprocessable_entity)
          end
        end
      end
  
      # passed
      context "when user is logged out" do
        it "does not allow creating a Book" do
          post books_path, params: { book: valid_attributes }
          expect(response).to have_http_status(:unauthorized) # Assuming your API requires authentication
        end
      end
    end
    
  describe "PUT /books/:id" do
    context "when user is logged in" do

      # did not pass
      it "updates the Book with valid parameters" do
        put book_path(book), params: { book: valid_attributes }, headers: auth_headers
        book.reload
        expect(book.book_name).to eq(valid_attributes[:book_name])
        expect(response).to have_http_status(:ok)
      end

      # did not pass
      it "does not update the Book with invalid parameters" do
        put book_path(book), params: { book: invalid_attributes }, headers: auth_headers
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end

    context "when user is logged out" do
    
      # did not pass
      it "does not allow updating a Book" do
        put book_path(book), params: { book: valid_attributes }
        expect(response).to have_http_status(:unauthorized)
      end
    end
  end

  describe "DELETE /books/:id" do
    let!(:book_to_delete) { FactoryBot.create(:book, category: category, publisher: publisher) }
    
    context "when user is logged in" do
      
      # did not pass
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
