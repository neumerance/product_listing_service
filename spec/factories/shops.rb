FactoryBot.define do
  factory :shop do
    association :user
    name { FFaker::Company.name }
    description { FFaker::Lorem.paragraph }
    tags { ['fastfood', 'food'] }
    order_forwarding_number { '+63092377877878' }
    business_phone_number { '+63092377877878' }
    business_openning_time { '09:30' }
    business_closing_time { '19:00' }
    route { 'Rizal Avenue' }
    locality { 'Olongapo' }
    administrative_area_level_1 { 'Central Luzon' }
    country { 'Philippines' }

    trait :with_products do
      after :create do |shop|
        create_list(:product, 3, :with_images, shop: shop)
      end
    end
  end
end
