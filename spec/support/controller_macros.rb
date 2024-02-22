# Filename: /home/deniojr/Desktop/ruby_on_rails_studies/library_api/spec/support/controller_macros.rb
# Path: /home/deniojr/Desktop/ruby_on_rails_studies/library_api/spec/support
# Created Date: Thursday, February 22nd 2024, 10:54:29 am
# Author: Dênio Barbosa Júnior

# Copyright (c) 2024 Your Company

module ControllerMacros
  def login_user
    before(:each) do
      @request.env["devise.mapping"] = Devise.mappings[:user]
      user = FactoryBot.create(:user)
      sign_in user
    end
  end
end
