FactoryBot.define do
  factory :user do
    first_name { Faker::Name.first_name }
    last_name { Faker::Name.last_name }
    email     { Faker::Internet.email }
    password  { 'password' }
    role      { 'admin' }
  end

  trait :as_admin do
    role { 'admin' }
  end
  
  trait :as_supervisor do
    role { 'supervisor' }
  end

  trait :as_manager do
    role { 'manager' }
  end

  trait :as_regular do
    role { 'regular' }
  end
end
