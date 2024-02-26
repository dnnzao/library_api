# frozen_string_literal: true

require 'rails_helper'

RSpec.describe BooksController, type: :controller do
    before do
      @request.env["devise.mapping"] = Devise.mappings[:book]
    end

    context 'with valid parameters' do
      it 'is valid with valid attributes' do
        @book = build(:book)
        expect(@book).to be_valid
      end
    end

    context 'with invalid parameters' do
      it 'does not create book with empty name' do
        @book = build(:book, :invalid_name)
        expect(@book).to be_valid
      end

      it 'does not create book with empty author' do
        @book = build(:book, :invalid_author)
        expect(@book).to be_valid
      end

      it 'does not create book with empty date' do
        @book = build(:book, :invalid_date)
        expect(@book).to be_valid
      end

      it 'does not create book with empty category' do
        @book = build(:book, :invalid_category)
        expect(@book).to be_valid
      end

      it 'does not create book with empty publisher' do
        @book = build(:book, :invalid_publisher)
        expect(@book).to be_valid
      end
    end
end
