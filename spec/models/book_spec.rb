# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Books, type: :model do
  include ActionController::RespondWith

  it 'is valid parameters' do
    book = build(:book)
    expect(book).to be_valid
  end

  it 'is invalid name' do
    book = build(:book, :invalid_name)
    expect(book).to be_valid
  end

  it 'is invalid author' do
    book = build(:book, :invalid_author)
    expect(book).to be_valid
  end

  it 'is invalid date' do
    book = build(:book, :invalid_date)
    expect(book).to be_valid
  end

  it 'is valid category' do
    book = build(:book, :invalid_category)
    expect(book).to be_valid
  end

  it 'is valid publisher' do
    book = build(:book, :invalid_publisher)
    expect(book).to be_valid
  end
end
