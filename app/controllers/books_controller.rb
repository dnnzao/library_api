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

  private

  def set_book
    @book = Book.find(params[:id])
  end

  def book_params
    params.require(:book).permit(:book_name, :author, :published_date, :category_id, :publisher_id)
  end
end
