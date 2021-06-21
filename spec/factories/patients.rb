FactoryBot.define do
  factory :patient do
    name { Faker::Name.first_name }
    birth_date { Date.parse('Sep 22 1998') }
    cpf { Faker::CPF.number }
  end
end
