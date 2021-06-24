class BookSuggestionService
  def initialize(suggestion_params, user)
    @suggestion_params = suggestion_params
    @user = user
  end

  def new_book_suggestion
    book_suggestion = BookSuggestion.new(@suggestion_params)
    book_suggestion.user = @user
    book_suggestion
  end
end
