# frozen_string_literal: true

require 'rails_helper'

RSpec.describe User, type: :model do
  include ActionController::RespondWith

  it 'is valid with valid attributes' do
    user = FactoryBot.build(:user)
    expect(user).to be_valid
  end

  it 'is not valid without a name' do
    valid_user = FactoryBot.build(:user)
    invalid_user = FactoryBot.build(:user, name: '')
    expect(invalid_user).not_to eq(valid_user)
  end

  it 'is not valid without an email' do
    user = FactoryBot.build(:user, email: nil)
    expect(user).not_to be_valid
  end
end
