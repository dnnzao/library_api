# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'User Confirmations', type: :request do
  let(:user) { FactoryBot.create(:user, :unconfirmed) }

  before do
    @raw_confirmation_token, enc_confirmation_token = Devise.token_generator.generate(User, :confirmation_token)
    user.update(confirmation_token: enc_confirmation_token, confirmation_sent_at: Time.now.utc)
  end

  it 'confirms the user' do
    get user_confirmation_path(confirmation_token: @raw_confirmation_token)
    expect(response).to redirect_to(some_path)
    user.reload
    expect(user.confirmed?).to be true
  end
end
