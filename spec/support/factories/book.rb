FactoryBot.define do
  factory :book do
    title { Faker::Book.title.truncate(25) }
    author  { Faker::Book.author }
    editor  { Faker::Name.name }
    year { Faker::Date.between(from: '1950-01-01', to: '2021-01-01').year.to_s }
    book_genre { Faker::Book.genre }
    image { Faker::Internet.url }
  end
end
