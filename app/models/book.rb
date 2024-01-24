# app/models/book.rb
class Book < ApplicationRecord
  include PgSearch::Model
  pg_search_scope :search_by_name, against: :book_name, using: {
    tsearch: {
      prefix: true, any_word: true
    }
  }

  multisearchable against: [:book_name, :author]
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

  def self.search_by_name(book_names)
    return all unless book_names.present?

    conditions = book_names.split(',').map do |name|
      "lower(book_name) ILIKE :name#{name.hash}"
    end

    where(conditions.join(' OR '), book_names.split(',').map { |name| ["name#{name.hash}".to_sym, "%#{name.downcase}%"] }.to_h)
  end
end



=begin
# app/models/book.rb
class Book < ApplicationRecord
  include PgSearch::Model
  pg_search_scope :search_by_name, against: :book_name, using: {
    tsearch: {
      prefix: true, any_word: true
    }
  }

  multisearchable against: [:book_name, :author]
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
=end
