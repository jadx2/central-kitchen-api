FactoryBot.define do
  factory :workshop do
    title { Faker::Lorem.word }
    description { Faker::Lorem.sentence }
    dates { Faker::Lorem.words(number: 4) }
    image { Faker::Lorem.word }
  end
end
