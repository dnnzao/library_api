#
#Filename: /home/deniojr/Desktop/ruby_on_rails_studies/library_api/db/migrate/20240118172221_create_books.rb
#Path: /home/deniojr/Desktop/ruby_on_rails_studies/library_api/db/migrate
#Created Date: Thursday, February 1st 2024, 4:02:58 pm
#Author: Dênio Barbosa Júnior
#
#Copyright (c) 2024 Your Company
#


class CreateBooks < ActiveRecord::Migration[7.1]
  def change
    create_table :books do |t|
      t.string :book_name
      t.string :author
      t.date :published_date
      t.references :category, null: false, foreign_key: true
      t.references :publisher, null: false, foreign_key: true
      t.timestamps
    end
  end
end
