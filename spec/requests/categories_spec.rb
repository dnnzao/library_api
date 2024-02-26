# frozen_string_literal: true

require 'rails_helper'

RSpec.describe CategoriesController, type: :controller do
  before do
    @request.env["devise.mapping"] = Devise.mappings[:category]
  end

  it 'is valid with valid attributes' do
    @category = build(:category)
    expect(@category).to be_valid
  end

  it 'is valid with valid attributes' do
    @category = build(:category, :invalid_category)
    expect(@category).to_not be_valid
  end
end
