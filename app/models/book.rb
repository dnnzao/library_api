# frozen_string_literal: true

#
# Filename: /home/deniojr/Desktop/ruby_on_rails_studies/library_api/app/models/book.rb
# Path: /home/deniojr/Desktop/ruby_on_rails_studies/library_api/app/models
# Created Date: Thursday, February 1st 2024, 4:02:58 pm
# Author: Dênio Barbosa Júnior
#
# Copyright (c) 2024 Your Company
#

class Book < ApplicationRecord
  include PgSearch::Model

  pg_search_scope :search_by_name, lambda { |book_name|
    return {} if book_name.blank?

    {
      against: :book_name,
      query: book_name.split(',').map { |name| "%#{name.downcase}%" }.join(' | '),
      using: { tsearch: { prefix: true } },
      order_within_rank: 'book_name ASC'
    }
  }

  multisearchable against: [:book_name]
  belongs_to :category
  belongs_to :publisher

  def self.filter_books(category_ids, publisher_ids, book_name)
    books = all

    books = filter_by_categories(books, category_ids) if category_ids.present?

    books = filter_by_publishers(books, publisher_ids) if publisher_ids.present?

    books = search_by_name(book_name) if book_name.present?

    books
  end

  def self.filter_by_categories(books, category_ids)
    category_ids = category_ids.split(',')
    books.where(category_id: category_ids)
  end

  def self.filter_by_publishers(books, publisher_ids)
    publisher_ids = publisher_ids.split(',')
    books.where(publisher_id: publisher_ids)
  end

  validates :book_name, presence: true
  validates :author, presence: true
  validates :published_date, presence: true
end
