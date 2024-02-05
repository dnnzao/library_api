#
#Filename: /home/deniojr/Desktop/ruby_on_rails_studies/library_api/app/controllers/api/v1/email_controller.rb
#Path: /home/deniojr/Desktop/ruby_on_rails_studies/library_api/app/controllers/api/v1
#Created Date: Thursday, February 1st 2024, 4:02:58 pm
#Author: Dênio Barbosa Júnior
#
#Copyright (c) 2024 Your Company
#


module Api
  module V1
    class EmailController < ApplicationController
      def send_test_email
        # Other logic here if needed

        # Send the test email using the sample_email method
        ApplicationMailer.confirmation_email.deliver_now

        # Respond with a success message or appropriate response
        render json: { message: 'Test email sent successfully' }
      end
    end
  end
end
