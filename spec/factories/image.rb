FactoryBot.define do
  factory :image do
    sequence(:name) { |n| "image-#{n}" }
  end
end
