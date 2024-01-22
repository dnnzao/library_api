# app/controllers/publishers_controller.rb
class PublishersController < ApplicationController
  before_action :set_publisher, only: %i[show update destroy]

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

  def show_by_id
    @publisher = Publisher.find(params[:id])
    render json: @publisher
  end

  def show
    @publisher = Publisher.find(params[:id])
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

  def search_by_name_or_id
    search_param = params[:search_param]

    if search_param.present?
      publisher = if search_param.to_i.to_s == search_param
                    Publisher.find_by(id: search_param.to_i)
                  else
                    Publisher.where('lower(publisher_name) = ?', search_param.downcase).first
                  end

      if publisher
        render json: publisher, include: [:books]
      else
        render json: { error: 'Publisher not found' }, status: :not_found
      end
    else
      render json: { error: 'Search parameter is required' }, status: :bad_request
    end
  end

  private

  def set_publisher
    @publisher = Publisher.find(params[:id])
  end

  def publisher_params
    params.require(:publisher).permit(:publisher_name)
  end
end
