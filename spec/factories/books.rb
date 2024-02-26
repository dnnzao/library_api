# frozen_string_literal: true

# spec/factories/books.rb
FactoryBot.define do
  factory :book do
    book_name { 'The Factory Bot Book 2' }
    author { 'Factory Bot' }
    published_date { Date.current }
    association :category, factory: :category
    association :publisher, factory: :publisher

    trait :invalid_book do
      book_name { '' }
      author { '' }
      published_date { '' }
      category { nil }
      publisher { nil }
    end
  end
end
