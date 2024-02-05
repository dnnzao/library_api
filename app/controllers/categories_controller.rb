# app/controllers/categories_controller.rb
class CategoriesController < ActionController::API
  before_action :set_category, only: %i[show update destroy]

  def index
    @categories = Category.all

    render json: @categories, include: [:books]
  end

  def show
    render json: @category, include: [:books]
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
