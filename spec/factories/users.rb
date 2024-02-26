# frozen_string_literal: true

FactoryBot.define do
  factory :user do
    name { 'Factory Bot' }
    email { Faker::Internet.email }
    password { 'password123' }
    password_confirmation { 'password123' }
    confirmed_at { Date.today }

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
