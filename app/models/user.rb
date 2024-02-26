# frozen_string_literal: true

#
# Filename: /home/deniojr/Desktop/ruby_on_rails_studies/library_api/app/models/user.rb
# Path: /home/deniojr/Desktop/ruby_on_rails_studies/library_api/app/models
# Created Date: Thursday, February 1st 2024, 4:02:58 pm
# Author: Dênio Barbosa Júnior
#
# Copyright (c) 2024 Your Company
#

class User < ApplicationRecord
  extend Devise::Models
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :confirmable

  include DeviseTokenAuth::Concerns::User

  validates :name, presence: true
  validates :email, presence: true
  validates :password, presence: true
  # validates :password_confirmation, presence: true
end
