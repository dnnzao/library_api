# frozen_string_literal: true

# spec/factories/categories.rb
FactoryBot.define do
  factory :category do
    name { 'Factory Bot Category' }

    trait :invalid_category do
      name { '' }
    end
  end
end
