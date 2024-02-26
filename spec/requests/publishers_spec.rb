# frozen_string_literal: true

require 'rails_helper'

RSpec.describe PublishersController, type: :controller do
  before do
    @request.env["devise.mapping"] = Devise.mappings[:publisher]
  end

  it 'is valid with valid attributes' do
    @publisher = build(:publisher)
    expect(@publisher).to be_valid
  end

  it 'is valid with valid attributes' do
    @publisher = build(:publisher, :invalid_publisher)
    expect(@publisher).to_not be_valid
  end
end