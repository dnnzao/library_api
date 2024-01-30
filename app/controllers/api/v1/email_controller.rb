# app/controllers/api/v1/email_controller.rb
module Api
  module V1
    class EmailController < ApplicationController
      def send_test_email
        # Other logic here if needed

        # Send the test email using the sample_email method
        ApplicationMailer.sample_email.deliver_now

        # Respond with a success message or appropriate response
        render json: { message: 'Test email sent successfully' }
      end
    end
  end
end
