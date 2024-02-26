# frozen_string_literal: true

FactoryBot.define do
  factory :user do
    name { Faker::Name.name }
    email { Faker::Internet.unique.email }
    password { 'password123' }
    password_confirmation { 'password123' }
    confirmed_at { Time.now }

    trait :invalid_user do
      name { '' }
      email { '' }
      password { '' }
      password_confirmation { '' }
    end

    trait :unconfirmed_email do
      confirmation_token { '' }
    end
  end
end
