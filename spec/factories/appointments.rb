FactoryBot.define do
  factory :appointment do
    starts_at { Time.now }
    ends_at { Time.now + 1800 }
    patient
    doctor
  end
end
