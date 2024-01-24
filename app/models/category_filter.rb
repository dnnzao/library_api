# app/models/category_filter.rb
class CategoryFilter
  def self.filter_books(books, category_identifiers)
    return books unless category_identifiers.present?

    identifiers = category_identifiers.split(',')

    if contains_names?(identifiers)
      category_ids = Category.where('lower(name) IN (?)', identifiers.map(&:downcase)).pluck(:id)
    else
      category_ids = extract_ids(identifiers)
    end

    books.where(category_id: category_ids)
  end

  private

  def self.contains_names?(identifiers)
    identifiers.any? { |identifier| !identifier.to_s.match?(/^\d+$/) }
  end

  def self.extract_ids(identifiers)
    identifiers.map(&:to_i)
  end
end
