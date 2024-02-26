# frozen_string_literal: true

# spec/factories/books.rb
FactoryBot.define do
  factory :book do
    book_name { 'The Factory Bot Book 2' }
    author { 'Factory Bot' }
    published_date { Date.current }
    association :category, factory: :category
    association :publisher, factory: :publisher

    trait :invalid_name do
      book_name { '' }
    end

    trait :invalid_author do
      author { '' }
    end

    trait :invalid_date do
      published_date { '' }
    end

    trait :invalid_category do
      association :category, factory: :category
    end

    trait :invalid_publisher do
      association :publisher, factory: :publisher
    end
  end
end
