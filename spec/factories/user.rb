FactoryBot.define do
  factory :user do
    name { 'Emanuele Tozzato' }
    sequence(:email) { |n| "user-#{n}@example.com" }
    password { '987654321' }

    trait :invalid do
      name { '' }
      email { '' }
    end

    trait :with_images do
      transient do
        images_count { 5 }
      end
      after(:build) do |user, evaluator|
        create_list(:image, evaluator.images_count, user: user)
      end
    end
  end
end
