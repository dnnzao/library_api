#
#Filename: /home/deniojr/Desktop/ruby_on_rails_studies/library_api/lib/tasks/db_tasks.rake
#Path: /home/deniojr/Desktop/ruby_on_rails_studies/library_api/lib/tasks
#Created Date: Friday, February 9th 2024, 2:30:15 pm
#Author: Dênio Barbosa Júnior
#
#Copyright (c) 2024 Your Company
#


namespace :db do
    desc "Reset PK sequence for certain tables"
    task reset_pk_sequence: :environment do
        tables = %w[users books publishers categories]
        tables.each do |table|
            ActiveRecord::Base.connection.reset_pk_sequence!(table)
            puts "Reset PK sequence for #{table}"
        end
    end
end
  