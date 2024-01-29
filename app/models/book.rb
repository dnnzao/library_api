# app/models/book.rb
class Book < ApplicationRecord
  include PgSearch::Model

  pg_search_scope :search_by_name, lambda { |book_name|
   {
      against: :book_name,
      query: book_name.split(',').map { |name| "%#{name.downcase}%" }.join(' | '),
      using: { tsearch: { prefix: true }},
      order_within_rank: "book_name ASC"
    }
  }

  multisearchable against: [:book_name]
  belongs_to :category
  belongs_to :publisher

  def self.filter_books(category_ids, publisher_ids, book_names)
    books = all

    books = filter_by_categories(books, category_ids)
    books = filter_by_publishers(books, publisher_ids)
    books = search_by_name(book_names)

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


=begin
  pg_search_scope :search_by_name, against: :book_name
=end
