# frozen_string_literal: true

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
  # before_action :authenticate_user!, only: %i[create update destroy]

  def index
    category_ids = params[:categories] || []
    publisher_ids = params[:publishers] || []
    book_names = params[:books] || []

    begin
      if category_ids.present? || publisher_ids.present?
        # Ensure that your filter_books method filters books based on category and publisher IDs correctly.
        @books = Book.filter_books(category_ids, publisher_ids, book_names)

        if @books.empty?
          render json: { error: 'No books found for the selected criteria' }, status: :not_found
        else
          render json: @books, include: %i[category publisher], status: :ok
        end
      elsif book_names.present?
        # Ensure that your search_by_name method filters books based on book names correctly.
        @books = Book.search_by_name(book_names)

        if @books.empty?
          render json: { error: 'No books found with the provided name(s)' }, status: :not_found
        else
          render json: @books, include: %i[category publisher], status: :ok
        end
      else
        # This block should return all books when no filters are applied.
        @books = Book.all
        render json: @books, include: %i[category publisher], status: :ok
      end
    rescue StandardError => e
      render json: { error: "An error occurred: #{e.message}" }, status: :internal_server_error
    end
  end

  def show
    if @book
      render json: @book, include: %i[category publisher]
    else
      render json: { error: 'Book not found' }, status: :not_found
    end
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
    if @book
      @book.destroy
      head :no_content
    else
      render json: { error: 'Book not found' }, status: :not_found
    end
  end

  private

  def set_book
    @book = Book.find_by(id: params[:id])
  end

  def book_params
    params.require(:book).permit(:book_name, :author, :published_date, :category_id, :publisher_id)
  end
end
