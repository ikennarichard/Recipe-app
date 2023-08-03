FactoryBot.define do
  factory :recipe do
    sequence(:id) { |n| n }
    sequence(:name) { |n| "Recipe-#{n}" }
    preparation_time { 1.0 }
    cooking_time { 1.0 }
    description { 'All about the recipe' }
    association :user, factory: :user
  end
end