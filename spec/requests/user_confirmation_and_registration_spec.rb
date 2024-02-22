# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'User Registration and Email Confirmation', type: :request do
  describe 'POST /api/v1/users' do
    let(:user_params) do
      {
        user: {
          name: 'John Doe',
          email: 'johnny_cage@email.com',
          password: 'securepassword',
          password_confirmation: 'securepassword'
        }
      }
    end

    before { ActionMailer::Base.deliveries.clear }

    it 'registers a user and confirms their email' do
      # Trigger user registration
      post '/api/v1/users', params: user_params

      expect(ActionMailer::Base.deliveries.size).to eq(1)
      email = ActionMailer::Base.deliveries.last

      # Assuming the email body is HTML, you might use Nokogiri to parse it:
      # require 'nokogiri'
      # html_part = Nokogiri::HTML(email.html_part.body.decoded)
      # confirmation_link = html_part.at('a:contains("Confirm my account")')['href']

      # Simple regex approach (not recommended for complex HTML emails):
      mail_body = email.body.encoded
      confirmation_link = mail_body.match(/href="([^"]+)"/)[1]

      # Extract token from URL
      token_query = URI.parse(confirmation_link).query
      confirmation_token = CGI.parse(token_query)['confirmation_token'].first

      # Simulate clicking the confirmation link
      get "/users/confirmation?confirmation_token=#{confirmation_token}"

      expect(response).to redirect_to(some_path_after_confirmation) # Adjust based on your app
      follow_redirect!
      expect(response.body).to include('Your email has been successfully confirmed.')
    end
  end
end
