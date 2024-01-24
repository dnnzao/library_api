# app/controllers/books_controller.rb
class BooksController < ApplicationController
  before_action :set_book, only: %i[show update destroy]

  def index
    category_ids = params[:category] || []
    publisher_ids = params[:publisher] || []
    book_identifiers = params[:book] || []

    if category_ids.present? || publisher_ids.present? || book_identifiers.present?
      @books = Book.filter_books(category_ids, publisher_ids, book_identifiers)
    else
      @books = Book.all
    end

    render json: @books, include: [:category, :publisher]
  end

  def show
    render json: @book, include: [:category, :publisher]
  end

  def create
    @book = Book.new(book_params)

    if @book.save
      render json: @book, status: :created
    else
      render json: @book.errors, status: :unprocessable_entity
    end
  end

  def update
    if @book.update(book_params)
      render json: @book
    else
      render json: @book.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @book.destroy
    head :no_content
  end

  private

  def set_book
    @book = Book.find(params[:id])
  end

  def book_params
    params.require(:book).permit(:book_name, :author, :published_date, :category_id, :publisher_id)
  end
end
