# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Category, type: :model do
  include ActionController::RespondWith

  it 'is valid with a name' do
    category = build(:category)
    expect(category).to be_valid
  end

  it 'is not valid without a name' do
    category = build(:category, :invalid_category)
    expect(category).not_to be_valid
  end
end
