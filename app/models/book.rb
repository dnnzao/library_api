# app/models/book.rb
class Book < ApplicationRecord
  belongs_to :category
  belongs_to :publisher

  def self.filter_by_categories_and_publisher(category_identifiers, publisher_identifiers, book_identifiers)
    books = all

    books = CategoryFilter.filter_books(books, category_identifiers)
    books = PublisherFilter.filter_books(books, publisher_identifiers)
    books = BookFilter.filter_books(books, category_identifiers, publisher_identifiers, book_identifiers)

    books
  end
end
