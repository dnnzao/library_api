#
#Filename: /home/deniojr/Desktop/ruby_on_rails_studies/library_api/db/migrate/20240124142601_create_pg_search_documents.rb
#Path: /home/deniojr/Desktop/ruby_on_rails_studies/library_api/db/migrate
#Created Date: Thursday, February 1st 2024, 4:02:58 pm
#Author: Dênio Barbosa Júnior
#
#Copyright (c) 2024 Your Company
#


class CreatePgSearchDocuments < ActiveRecord::Migration[7.1]
  def up
    say_with_time("Creating table for pg_search multisearch") do
      create_table :pg_search_documents do |t|
        t.text :content
        t.references :book, index: true
        t.belongs_to :searchable, polymorphic: true, index: true
        t.timestamps null: false
      end
    end
  end

  def down
    say_with_time("Dropping table for pg_search multisearch") do
      drop_table :pg_search_documents
    end
  end
end
