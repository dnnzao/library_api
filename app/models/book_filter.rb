# app/models/book_filter.rb
class BookFilter
  def self.filter_books(books, category_identifiers, publisher_identifiers, book_identifiers)
    books = CategoryFilter.filter_books(books, category_identifiers)
    books = PublisherFilter.filter_books(books, publisher_identifiers)
    books = filter_by_name_and_ids(books, book_identifiers)
    books
  end

  private

  def self.filter_by_name_and_ids(books, book_identifiers)
    return books unless book_identifiers.present?

    book_identifiers = book_identifiers.split(',') if book_identifiers.is_a?(String)

    if book_identifiers.all? { |id| id =~ /\A\d+\z/ }
      filter_by_ids(books, book_identifiers.map(&:to_i))
    else
      filter_by_name(books, book_identifiers)
    end
  end

  def self.filter_by_name(books, book_names)
    books.where('lower(book_name) IN (?)', book_names.map(&:downcase))
  end

  def self.filter_by_ids(books, book_ids)
    books.where(id: book_ids)
  end
end
