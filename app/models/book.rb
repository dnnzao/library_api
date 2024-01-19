class Book < ApplicationRecord
  belongs_to :category, class_name: 'Category', foreign_key: 'categories_id'
  belongs_to :publisher, class_name: 'Publisher', foreign_key: 'publishers_id'
end
