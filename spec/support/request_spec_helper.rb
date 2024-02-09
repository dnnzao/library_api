#
#Filename: /home/deniojr/Desktop/ruby_on_rails_studies/library_api/spec/support/request_spec_helper.rb
#Path: /home/deniojr/Desktop/ruby_on_rails_studies/library_api/spec/support
#Created Date: Friday, February 9th 2024, 4:18:32 pm
#Author: Dênio Barbosa Júnior
#
#Copyright (c) 2024 Your Company
#


module RequestSpecHelper
    def auth_headers(user)
        post user_session_path, params: { email: user.email, password: 'password123' }, as: :json
        response.headers.slice('client', 'access-token', 'uid')
    end
end
  
RSpec.configure do |config|
config.include RequestSpecHelper, type: :request
end