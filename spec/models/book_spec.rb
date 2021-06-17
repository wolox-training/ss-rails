require 'rails_helper'

describe Book do
  subject(:book) { build(:book) }

  describe '#create new book' do
    context 'when the book is created' do
      it 'be valid' do
        book.save!
        expect(book).to be_valid
      end

      it 'have title, author and editor' do
        book.save!
        expect(book.title).to be_present
        expect(book.author).to be_present
        expect(book.editor).to be_present
      end

      it 'have book_genre, year and image' do
        book.save!
        expect(book.book_genre).to be_present
        expect(book.year).to be_present
        expect(book.image).to be_present
      end

      it 'is not valid without a title' do
        book.title = nil
        book.save
        expect(book).not_to be_valid
      end
    end
  end
end
