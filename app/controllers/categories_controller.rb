# frozen_string_literal: true

#
# Filename: /home/deniojr/Desktop/ruby_on_rails_studies/library_api/app/controllers/categories_controller.rb
# Path: /home/deniojr/Desktop/ruby_on_rails_studies/library_api/app/controllers
# Created Date: Thursday, February 1st 2024, 4:02:58 pm
# Author: Dênio Barbosa Júnior
#
# Copyright (c) 2024 Your Company
#

class CategoriesController < ApplicationController
  before_action :set_category, only: %i[show update destroy]
  # before_action :authenticate_user!, only: %i[create update destroy]

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
    params.require(:category).permit(:name)
  end
end
