module Api
  module V1
    class BookSuggestionsController < ApiController
      skip_before_action :authenticate_user!, only: :create
      def create
        book_suggestion = BookSuggestion.new(book_suggestion_params)
        book_suggestion.user = current_user if user_signed_in?
        if book_suggestion.save
          render json: book_suggestion, status: :created
        else
          render json: { errors: [{ code: '400', message: book_suggestion.errors }] }, status: :bad_request
        end
      end

      private

      def book_suggestion_params
        params.require(:book_suggestion).permit(:title, :year, :synopsis, :price, :author, :editor, :link)
      end
    end
  end
end
