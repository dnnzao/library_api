#
# Filename: /home/deniojr/Desktop/ruby_on_rails_studies/library_api/app/controllers/books_controller.rb
# Path: /home/deniojr/Desktop/ruby_on_rails_studies/library_api/app/controllers
# Created Date: Thursday, February 1st 2024, 4:02:58 pm
# Author: Dênio Barbosa Júnior
#
# Copyright (c) 2024 Your Company
#

class BooksController < ApplicationController
  before_action :set_book, only: %i[show update destroy]
  before_action :authenticate_user!, only: %i[show create update destroy]

  def index
    category_ids = params[:categories] || []
    publisher_ids = params[:publishers] || []
    book_names = params[:books] || []

    begin
      if category_ids.present? || publisher_ids.present?
        @books = Book.filter_books(category_ids, publisher_ids, book_names)

        if @books.empty?
          render json: { error: 'No books found for the selected criteria' }, status: :not_found
        else
          render json: @books, include: %i[category publisher], status: :ok
        end
      elsif book_names.present?
        @books = Book.search_by_name(book_names)

        if @books.empty?
          render json: { error: 'No books found with the provided name(s)' }, status: :not_found
        else
          render json: @books, include: %i[category publisher], status: :ok
        end
      else
        @books = Book.all
        render json: @books, include: %i[category publisher], status: :ok
      end
    rescue StandardError => e
      render json: { error: "An error occurred: #{e.message}" }, status: :internal_server_error
    end
  end

  def show
    @book = Book.find(params[:id])
    if @book
      render json: @book
    else
      render json: { error: 'Book not found' }, status: :not_found
    end
  end

  # GET /list_books - all books
  def list_books
    @books = Book.all
    render json: @books
  end

  def create
    existing_book = Book.includes(:category, :publisher).find_by(book_name: book_params[:book_name], author: book_params[:author], category_id: book_params[:category_id])

    if existing_book
      book_info = {
        book_name: existing_book.book_name,
        author: existing_book.author,
        category: existing_book.category&.name,
        publisher: existing_book.publisher&.name,
        published_date: existing_book.published_date
      }

      render json: { message: "This book is already registered in the database", book_info: book_info }, status: :unprocessable_entity
    else
      @book = Book.new(book_params)

      if @book.save
        render json: @book, status: :created
      else
        render json: @book.errors, status: :unprocessable_entity
      end
    end
  end

  def update
    if @book
      if @book.update(book_params)
        render json: @book
      else
        render json: @book.errors, status: :unprocessable_entity
      end
    else
      render json: { error: 'Book not found' }, status: :not_found
    end
  end

  def destroy
    if @book.destroy!
      head :no_content
    else
      render json: { error: 'Book not found' }, status: :not_found
    end
  end

  private

  def set_book
    @book = Book.find(params[:id])
    puts @book
  end

  def book_params
    params.require(:book).permit(:book_name, :author, :published_date, :category_id, :publisher_id)
  end
end