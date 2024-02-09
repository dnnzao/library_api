# spec/factories/books.rb
FactoryBot.define do
    factory :book do
      book_name { "The Factory Bot Book" }
      author { "Factory Bot" }
      published_date { Date.current }
      category
      publisher
    end
end