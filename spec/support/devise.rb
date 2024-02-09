#
#Filename: /home/deniojr/Desktop/ruby_on_rails_studies/library_api/spec/support/devise.rb
#Path: /home/deniojr/Desktop/ruby_on_rails_studies/library_api/spec/support
#Created Date: Friday, February 9th 2024, 3:35:28 pm
#Author: Dênio Barbosa Júnior
#
#Copyright (c) 2024 Your Company
#


RSpec.configure do |config|
    config.include Devise::Test::ControllerHelpers, type: :controller
    config.include Devise::Test::IntegrationHelpers, type: :request
end