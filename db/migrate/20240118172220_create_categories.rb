# frozen_string_literal: true

#
# Filename: /home/deniojr/Desktop/ruby_on_rails_studies/library_api/db/migrate/20240118172220_create_categories.rb
# Path: /home/deniojr/Desktop/ruby_on_rails_studies/library_api/db/migrate
# Created Date: Thursday, February 1st 2024, 4:02:58 pm
# Author: Dênio Barbosa Júnior
#
# Copyright (c) 2024 Your Company
#

# db/migrate/[timestamp]_create_categories.rb
class CreateCategories < ActiveRecord::Migration[7.1]
  def change
    create_table :categories do |t|
      t.string :name
      t.timestamps
    end
  end
end
