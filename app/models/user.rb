class User < ApplicationRecord
  extend Devise::Models
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable

  validates :email, :uniqueness => {:allow_blank => true}

  # validates_presence_of :email, if: :email_required?

  # validates_presence_of :password, if: :password_required?
  # validates_confirmation_of :password, if: :password_required?

  # protected

  # def email_required?
  #   true && profile_updation.blank?
  # end

  # def password_required?
  #   !password.nil? || !password_confirmation.nil?

  # end
end
