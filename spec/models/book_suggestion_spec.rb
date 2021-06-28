require 'rails_helper'

describe BookSuggestion do
  subject(:book_suggestion) { build(:book_suggestion) }

  describe '#create new book suggestion' do
    context 'when the suggestion is created' do
      it 'be valid' do
        book_suggestion.save!
        expect(book_suggestion).to be_valid
      end

      it 'have title, author and editor' do
        book_suggestion.save!
        expect(book_suggestion.title).to be_present
        expect(book_suggestion.author).to be_present
        expect(book_suggestion.editor).to be_present
      end

      it 'have year, link and synopsis' do
        book_suggestion.save!
        expect(book_suggestion.link).to be_present
        expect(book_suggestion.year).to be_present
        expect(book_suggestion.synopsis).to be_present
      end

      it 'is not valid without a title' do
        book_suggestion.title = nil
        book_suggestion.save
        expect(book_suggestion).not_to be_valid
      end
    end
  end
end
