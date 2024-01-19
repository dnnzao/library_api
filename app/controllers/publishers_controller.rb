class PublishersController < ApplicationController
  before_action :set_publisher, only: %i[show update destroy]

  def index
    @publishers = Publisher.all
    render json: @publishers
  end

  def show
    render json: @publisher
  end

  def create
    @publisher = Publisher.new(publisher_params)

    if @publisher.save
      render json: @publisher, status: :created
    else
      render json: @publisher.errors, status: :unprocessable_entity
    end
  end

  def update
    if @publisher.update(publisher_params)
      render json: @publisher
    else
      render json: @publisher.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @publisher.destroy
    head :no_content
  end

  private

  def set_publisher
    @publisher = Publisher.find(params[:id])
  end

  def publisher_params
    params.require(:publisher).permit(:publisher_name)
  end
end
