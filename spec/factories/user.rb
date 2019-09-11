FactoryBot.define do
  factory :user do
    name { 'MyName' }
    sequence(:email) { |n| "user-#{n}@example.com" }
  end
end
