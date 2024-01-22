# app/controllers/categories_controller.rb
class CategoriesController < ApplicationController
  before_action :set_category, only: %i[show update destroy]

  def index
    if params[:id].present?
      category_ids = params[:id].split(',')
      @categories = Category.where(id: category_ids)
    elsif params[:category_name].present?
      @categories = Category.where('lower(category) = ?', params[:category_name].downcase)
    else
      @categories = Category.all
    end

    render json: @categories, include: [:books]
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

  def search_by_name_or_id
    search_param = params[:search_param]

    if search_param.present?
      category = if search_param.to_i.to_s == search_param
                   Category.find_by(id: search_param.to_i)
                 else
                   Category.where('lower(category) = ?', search_param.downcase).first
                 end

      if category
        render json: category, include: [:books]
      else
        render json: { error: 'Category not found' }, status: :not_found
      end
    else
      render json: { error: 'Search parameter is required' }, status: :bad_request
    end
  end

  private

  def set_category
    @category = Category.find(params[:id])
  end

  def category_params
    params.require(:category).permit(:category)
  end
end
