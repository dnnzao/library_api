# app/models/book.rb
class Book < ApplicationRecord
  belongs_to :category
  belongs_to :publisher

  def self.filter_by_categories_and_publisher(category_names, publisher_names)
    books = self.all

    # Filter by categories
    if category_names.present?
      category_names = category_names.split(',')
      category_ids = Category.where('lower(name) IN (?)', category_names.map(&:downcase)).pluck(:id)
      books = books.where(category_id: category_ids)
    end

    # Filter by publishers
    if publisher_names.present?
      publisher_names = publisher_names.split(',')
      publisher_ids = Publisher.where('lower(name) IN (?)', publisher_names.map(&:downcase)).pluck(:id)
      books = books.where(publisher_id: publisher_ids)
    end

    books
  end
end
