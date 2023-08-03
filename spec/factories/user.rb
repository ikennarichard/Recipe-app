FactoryBot.define do
  factory :user do
    sequence(:id) { |n| n }
    name { 'Santi' }
    sequence(:email) { |n| "user#{n}@example.com" }
    password { 'pass-1' }
    confirmed_at { Time.zone.now }
  end
end