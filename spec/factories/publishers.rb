# frozen_string_literal: true

FactoryBot.define do
  factory :publisher do
    name { 'Factory Bot Publisher' }

    trait :invalid_publisher do
      name { '' }
    end
  end
end
