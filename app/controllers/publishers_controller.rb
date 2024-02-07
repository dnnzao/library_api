#
#Filename: /home/deniojr/Desktop/ruby_on_rails_studies/library_api/app/controllers/publishers_controller.rb
#Path: /home/deniojr/Desktop/ruby_on_rails_studies/library_api/app/controllers
#Created Date: Thursday, February 1st 2024, 4:02:58 pm
#Author: Dênio Barbosa Júnior
#
#Copyright (c) 2024 Your Company
#


class PublishersController < ApplicationController::API
  before_action :set_publisher, only: %i[show update destroy]

  def index
    @publishers = Publisher.all

    render json: @publishers, include: [:books]
  end

  def show
    render json: @publisher, include: [:books]
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
