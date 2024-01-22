# db/migrate/[timestamp]_create_categories.rb
class CreateCategories < ActiveRecord::Migration[7.1]
  def change
    create_table :categories do |t|
      t.string :name
      t.timestamps
    end
  end
end
