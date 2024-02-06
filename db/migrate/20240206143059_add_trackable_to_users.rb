#
#Filename: /home/deniojr/Desktop/ruby_on_rails_studies/library_api/db/migrate/20240206143059_add_trackable_to_users.rb
#Path: /home/deniojr/Desktop/ruby_on_rails_studies/library_api/db/migrate
#Created Date: Tuesday, February 6th 2024, 11:30:59 am
#Author: Dênio Barbosa Júnior
#
#Copyright (c) 2024 Your Company
#


class AddTrackableToUsers < ActiveRecord::Migration[7.1]
  def change
    add_column :users, :sign_in_count, :integer, default: 0, null: false
    add_column :users, :current_sign_in_at, :datetime
    add_column :users, :last_sign_in_at, :datetime
    add_column :users, :current_sign_in_ip, :string
    add_column :users, :last_sign_in_ip, :string
  end
end

