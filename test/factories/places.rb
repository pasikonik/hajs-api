# frozen_string_literal: true

FactoryBot.define do
  factory :place do
    name { Faker::Lorem.word.capitalize }
    description { Faker::Lorem.sentence }
    address { Faker::Address.street_address }
    rent { Faker::Number.between(1000, 5000) }
  end
end
