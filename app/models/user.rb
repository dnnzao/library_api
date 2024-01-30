class User < ApplicationRecord
  extend Devise::Models # Make sure to include this line
  # Include any additional Devise modules you need
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :validatable
end
