# app/models/book.rb
class Book < ApplicationRecord
  include PgSearch::Model

  pg_search_scope :search_by_name, lambda { |book_names|
    return {} if book_names.blank?  # Return an empty search scope if no book names are provided
    {
      against: :book_name,
      query: book_names.split(',').map { |name| "%#{name.downcase}%" }.join(' | '),
      using: { tsearch: { prefix: true }},
      order_within_rank: "book_name ASC"
    }
  }

  multisearchable against: [:book_name]
  belongs_to :category
  belongs_to :publisher

  def self.filter_books(category_ids, publisher_ids, book_names)
    books = all

    # Filter by categories if category_ids are provided
    books = filter_by_categories(books, category_ids) if category_ids.present?

    # Filter by publishers if publisher_ids are provided
    books = filter_by_publishers(books, publisher_ids) if publisher_ids.present?

    # Filter by book names if book_names are provided
    books = search_by_name(book_names) if book_names.present?

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
end
