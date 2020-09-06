FactoryBot.define do
  factory :product do
    association :shop
    name { FFaker::Company.name }
    description { FFaker::Lorem.paragraph }
    price { 10 }

    trait :with_images do
      after :create do |product|
        create_list(:image, 3, imageable: product)
      end
    end
  end
end
