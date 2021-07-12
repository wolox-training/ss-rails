# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
puts 'Creating new books'
1000.times do
  book = Book.new(
    title: Faker::Book.title.truncate(25),
    author: Faker::Book.author, 
    editor: Faker::Name.name,
    year: Faker::Date.between(from: '1950-01-01', to: '2021-01-01').year.to_s,
    book_genre: Faker::Book.genre, 
    image: Faker::Internet.url
  )
  book.save!
end
puts 'Books created'
