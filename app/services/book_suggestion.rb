class BookSuggestionService
  def new_book_suggestion(book_suggestion)
    book_suggestion.user = current_user if user_signed_in?
    if book_suggestion.save
      render json: book_suggestion, status: :created
    else
      render json: { errors: [{ code: '422', message: book_suggestion.errors }] }, status: :unprocessable_entity
    end
  end
end
