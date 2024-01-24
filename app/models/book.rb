# app/models/book.rb
class Book < ApplicationRecord
  belongs_to :category
  belongs_to :publisher

  def self.filter_books(category_ids, publisher_ids, book_identifiers)
    books = all

    books = filter_by_categories(books, category_ids)
    books = filter_by_publishers(books, publisher_ids)
    books = filter_by_name_and_ids(books, book_identifiers)

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

  def self.filter_by_name_and_ids(books, book_identifiers)
    return books unless book_identifiers.present?

    book_identifiers = book_identifiers.split(',')
    book_ids = book_identifiers.select { |id| id.match?(/^\d+$/) }
    book_names = book_identifiers - book_ids

    books = books.where('lower(book_name) IN (?) OR id IN (?)', book_names.map(&:downcase), book_ids) if book_identifiers.present?

    books
  end
end
