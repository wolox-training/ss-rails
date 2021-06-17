class BooksController < ApplicationController
  # before_action :authenticate_user!
  include Wor::Paginate

  def index
    render_paginated Book, each_serializer: BookSerializer
  end

  def show
    book = Book.find(params[:id])
    render json: BookSerializer.new.serialize_to_json(book)
  end
end
