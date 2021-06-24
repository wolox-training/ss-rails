module Api
  module V1
    class BooksController < ApiController
      def index
        books = Book::Reducer.apply(params)
        render_paginated books, each_serializer: BookSerializer
      end

      def show
        book = Book.friendly.find(params[:id])
        render json: BookSerializer.new.serialize_to_json(book)
      end
    end
  end
end
