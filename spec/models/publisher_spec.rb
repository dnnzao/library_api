# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Publisher, type: :model do
  include ActionController::RespondWith

  it 'is valid with a name' do
    publisher = build(:publisher)
    expect(publisher).to be_valid
  end

  it 'is not valid without a name' do
    publisher = build(:publisher, :invalid_publisher)
    expect(publisher).not_to be_valid
  end
end
