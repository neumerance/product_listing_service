FactoryBot.define do
  factory :product do
    association :shop
    name { FFaker::Company.name }
    description { FFaker::Lorem.paragraph }
    price { 10 }

    trait :with_images do
    end
  end
end
