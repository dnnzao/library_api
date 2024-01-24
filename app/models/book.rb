# app/models/book.rb
class Book < ApplicationRecord
  belongs_to :category
  belongs_to :publisher

  def self.filter_books(category_ids, publisher_ids, book_names)
    books = all

    books = filter_by_categories(books, category_ids)
    books = filter_by_publishers(books, publisher_ids)
    books = filter_by_names(books, book_names)

    books
  end

  private

  def self.filter_by_categories(books, category_ids)
    return books unless category_ids.present?

    category_ids = category_ids.split(',')
    books.where(category_id: category_ids)
  end

  def self.filter_by_publishers(books, publisher_ids)
    return books unless publisher_ids.present?

    publisher_ids = publisher_ids.split(',')
    books.where(publisher_id: publisher_ids)
  end

  def self.filter_by_names(books, book_names)
    return books unless book_names.present?

    book_names = book_names.split(',')
    books.where('lower(book_name) IN (?)', book_names.map(&:downcase))
  end
end
