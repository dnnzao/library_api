# app/controllers/categories_controller.rb
class CategoriesController < ApplicationController
  before_action :set_category, only: %i[show update destroy]

  def index
    if params[:id].present?
      publisher_ids = params[:id].split(',')
      @publishers = Publisher.where(id: publisher_ids)
    elsif params[:publisher_name].present?
      @publishers = Publisher.where('lower(publisher_name) = ?', params[:publisher_name].downcase)
    else
      @publishers = Publisher.all
    end

    render json: @publishers, include: [:books]
  end

  def show
    render json: @category
  end

  def show_by_id
    @category = Category.find(params[:id])
    render json: @category
  end

  def create
    @category = Category.new(category_params)

    if @category.save
      render json: @category, status: :created
    else
      render json: @category.errors, status: :unprocessable_entity
    end
  end

  def update
    if @category.update(category_params)
      render json: @category
    else
      render json: @category.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @category.destroy
    head :no_content
  end

  private

  def set_category
    @category = Category.find(params[:id])
  end

  def category_params
    params.require(:category).permit(:category)
  end
end
