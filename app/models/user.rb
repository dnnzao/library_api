class User < ApplicationRecord
  extend Devise::Models
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable

  # after_create :send_confirmation_email

  # def send_confirmation_email
  #   # Generate the confirmation link
  #   confirmation_url = "http://yourapp.com/confirm/#{self.id}"

  #   # Send the confirmation email using Action Mailer
  #   UserMailer.confirmation_email(self, confirmation_url).deliver_now
  # end
end
