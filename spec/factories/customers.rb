FactoryBot.define do
  factory :customer do
    name { Faker::Company.name }
  end
end
