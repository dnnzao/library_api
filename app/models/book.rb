# app/models/book.rb
class Book < ApplicationRecord
  belongs_to :category
  belongs_to :publisher

  def self.filter_by_categories_and_publisher(category_names, publisher_name)
    books = self.all

    # Filter by categories
    if category_names.present?
      category_ids = Category.where('lower(name) IN (?)', category_names.map(&:downcase)).pluck(:id)
      books = books.where(category_id: category_ids)
    end

    # Filter by publisher
    if publisher_name.present?
      publisher_id = Publisher.where('lower(name) = ?', publisher_name.downcase).pluck(:id).first
      books = books.where(publisher_id: publisher_id)
    end

    books
  end
end
