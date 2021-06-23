class BookSerializer < Panko::Serializer
  attributes :author, :title, :image, :publisher, :year, :genre, :created_at, :updated_at

  def image
    { url: object.image }
  end

  def publisher
    object.editor
  end

  def genre
    object.book_genre
  end
end
