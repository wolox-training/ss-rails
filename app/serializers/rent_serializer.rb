class RentSerializer < Panko::Serializer
  attributes :id, :start_of_rent, :end_of_rent, :book, :user, :created_at, :updated_at

  def book
    {
      id: object.book.id,
      author: object.book.author,
      title: object.book.title,
      genre: object.book.book_genre,
      publisher: object.book.editor,
      year: object.book.year,
      image_url: object.book.image
    }
  end

  def user
    {
      id: object.user.id,
      first_name: object.user.first_name,
      last_name: object.user.last_name,
      email: object.user.email,
      image_url: object.user.image,
      rents_counter: object.user.rents.count
    }
  end
end
