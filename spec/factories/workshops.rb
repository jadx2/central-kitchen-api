# frozen_string_literal: true

FactoryBot.define do
  factory :workshop do
    title { Faker::Lorem.word }
    description { { subtitle: Faker::Lorem.sentence, description: Faker::Lorem.paragraph } }
    menu { [Faker::Lorem.sentence, Faker::Lorem.sentence, Faker::Lorem.sentence] }
    dates { Faker::Lorem.words(number: 4) }
    image { Faker::Internet.url }
  end
end
