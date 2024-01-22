# app/controllers/books_controller.rb
class BooksController < ApplicationController
  before_action :set_book, only: %i[show update destroy]

  def index
    if params[:id].present?
      book_ids = params[:id].split(',')
      @books = Book.where(id: book_ids)
    elsif params[:book_name].present?
      @books = Book.where('lower(book_name) = ?', params[:book_name].downcase)
    else
      @books = Book.all
    end

    render json: @books, include: [:category, :publisher]
  end

  def show
    render json: @book
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

  def search_by_name_or_id
    search_param = params[:search_param]

    if search_param.present?
      book = if search_param.to_i.to_s == search_param
               Book.find_by(id: search_param.to_i)
             else
               Book.where('lower(book_name) = ?', search_param.downcase).first
             end

      if book
        render json: book, include: [:category, :publisher]
      else
        render json: { error: 'Book not found' }, status: :not_found
      end
    else
      render json: { error: 'Search parameter is required' }, status: :bad_request
    end
  end

  private

  def set_book
    @book = Book.find(params[:id])
  end

  def book_params
    params.require(:book).permit(:book_name, :author, :published_date, :category_id, :publisher_id)
  end
end
