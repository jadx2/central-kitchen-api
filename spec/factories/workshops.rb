FactoryBot.define do
  factory :workshop do
    title { Faker::Lorem.word }
    description { { subtitle: Faker::Lorem.sentence, description: Faker::Lorem.paragraph } }
    menu { { dish1: Faker::Lorem.sentence, dish2: Faker::Lorem.sentence, dish3: Faker::Lorem.sentence } }
    dates { Faker::Lorem.words(number: 4) }
    image { Faker::Internet.url }
  end
end
