# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Books, type: :model do
  include ActionController::RespondWith

  it 'is valid parameters' do
    book = build(:book)
    expect(book).to be_valid
  end

  it 'is invalid name' do
    book = build(:book, :invalid_book)
    expect(book.book_name).blank?
  end

  it 'is invalid author' do
    book = build(:book, :invalid_book)
    expect(book.author).blank?
  end

  it 'is invalid date' do
    book = build(:book, :invalid_book)
    expect(book.published_date).blank?
  end

  it 'is invalid category' do
    book = build(:book, :invalid_book)
    expect(book.category).blank?
  end

  it 'is invalid publisher' do
    book = build(:book, :invalid_book)
    expect(book.publisher).blank?
  end
end
