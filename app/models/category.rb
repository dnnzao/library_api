#
#Filename: /home/deniojr/Desktop/ruby_on_rails_studies/library_api/app/models/category.rb
#Path: /home/deniojr/Desktop/ruby_on_rails_studies/library_api/app/models
#Created Date: Thursday, February 1st 2024, 4:02:58 pm
#Author: Dênio Barbosa Júnior
#
#Copyright (c) 2024 Your Company
#


class Category < ApplicationRecord
  has_many :books
end
