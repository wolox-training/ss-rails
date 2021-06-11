class OpenLibraryController < ApplicationController
  def show
    book = OpenLibrary.new(params[:isbn]).fetch_data
    if book.empty?
      render json: book, status: :unprocessable_entity
    else
      render json: book, status: :ok
    end
  end
end
