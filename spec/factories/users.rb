# frozen_string_literal: true

FactoryBot.define do
  factory :user do
    name { 'Factory Bot' }
    email { 'factory@bot.com' }
    password { 'password123' }
    password_confirmation { 'password123' }
  end
end
