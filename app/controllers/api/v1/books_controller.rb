module Api
  module V1
    class BooksController < ApplicationController
      def info
        open_library = OpenLibrary.new(params[:isbn])
        book = open_library.fetch_data
        respond_to do |format|
          if book != 'not found'
            format.json { render json: { status: 'Success', message: 'Loaded book', data: book }, status: :ok }
          else
            format.json { render json: { status: 'Unprocessable Entity', message: 'Book not found'}, status: :unprocessable_entity }
          end
        end
      end
    end
  end
end
