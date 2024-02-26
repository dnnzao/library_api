#
#Filename: /home/deniojr/Desktop/ruby_on_rails_studies/library_api/spec/auth_helpers.rb
#Path: /home/deniojr/Desktop/ruby_on_rails_studies/library_api/spec
#Created Date: Monday, February 26th 2024, 3:12:34 pm
#Author: Dênio Barbosa Júnior
#
#Copyright (c) 2024 Your Company
#

module AuthHelpers
  def authenticate_user(user)
    post user_session_path, params: { email: user.email, password: 'password123' }.to_json, headers: { 'Content-Type' => 'application/json' }
    expect(response).to have_http_status(:success)
    response.headers.slice('access-token', 'token-type', 'client', 'expiry', 'uid')
  end
end
