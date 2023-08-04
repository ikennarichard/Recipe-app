FactoryBot.define do
  factory :food do
    sequence(:name) { |n| "Foodname-#{n}" }
    measurement_unit { 'units' }
    price { '5.99' }

    trait :user do
      user
    end
  end
end