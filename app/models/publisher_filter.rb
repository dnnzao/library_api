# app/models/publisher_filter.rb
class PublisherFilter
  def self.filter_books(books, publisher_identifiers)
    return books unless publisher_identifiers.present?

    identifiers = publisher_identifiers.split(',')

    if contains_names?(identifiers)
      publisher_ids = Publisher.where('lower(name) IN (?)', identifiers.map(&:downcase)).pluck(:id)
    else
      publisher_ids = extract_ids(identifiers)
    end

    books.where(publisher_id: publisher_ids)
  end

  private

  def self.contains_names?(identifiers)
    identifiers.any? { |identifier| !identifier.to_s.match?(/^\d+$/) }
  end

  def self.extract_ids(identifiers)
    identifiers.map(&:to_i)
  end
end
