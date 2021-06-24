module Api
  module V1
    class OpenLibraryController < ApiController
      def show
        book = OpenLibrary.new(params[:isbn]).fetch_data
        if book.empty?
          render json: { errors: [{ code: '404', message: 'book not found' }] }, status: :not_found
        else
          render json: book, status: :ok
        end
      end
    end
  end
end
