# frozen_string_literal: true

FactoryBot.define do
  factory :doctor do
    name { Faker::Name.first_name }
    crm { Faker::Number.number(digits: 5) }
    crm_uf { Faker::Lorem.characters(number: 2) }
  end
end
