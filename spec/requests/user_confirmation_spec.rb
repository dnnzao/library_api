# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'User confirmation', type: :request do
  it 'confirms the user' do
    user = FactoryBot.create(:user)

    get user_confirmation_url(confirmation_token: user.confirmation_token)

    user.reload

    expect(user.confirmed?).to be true
  end
end
