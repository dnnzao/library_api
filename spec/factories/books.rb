# frozen_string_literal: true

# spec/factories/books.rb
FactoryBot.define do
  factory :book do
    book_name { 'The Factory Bot Book 2' }
    author { 'Factory Bot' }
    published_date { Date.current }
    category { 'Fantasy' }
    publisher { 'Factory Bot Publisher Inc.' }
  end
end
