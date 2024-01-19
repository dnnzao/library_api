class CreateBooks < ActiveRecord::Migration[7.1]
  def change
    create_table :books do |t|
      t.string :book_name
      t.string :author
      t.date :published_date
      t.references :categories, null: false, foreign_key: true
      t.references :publishers, null: false, foreign_key: true
      t.timestamps
    end
  end
end
