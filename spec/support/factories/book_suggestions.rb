FactoryBot.define do
  factory :book_suggestion do
    title { Faker::Book.title }
    author  { Faker::Book.author }
    editor  { Faker::Name.name }
    year { Faker::Date.between(from: '1950-01-01', to: '2021-01-01').year.to_s }
    link { Faker::Internet.url }
    synopsis { Faker::Lorem.paragraph }
  end
end
