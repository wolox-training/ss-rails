module Api
  module V1
    class BooksController < ApplicationController
      def info
        open_library = OpenLibrary.new(params[:isbn])
        book = open_library.fetch_data
        render json: { status: 'Success', message: 'Loaded book', data: book }
      end
    end
  end
end
