FactoryBot.define do
  factory :shop do
    association :user
    name { FFaker::Company.name }
    description { FFaker::Lorem.paragraph }
    tags { ['fastfood', 'food'] }
    facebook_page_url { 'http://www.facebook.com/showstore' }
    website_url { FFaker::Internet.uri(:https) }
    has_delivery_service { true }
    tax_percentage { 0.00 }
    delivery_fee { 0.00 }
    stop_orders { false }
    minimum_purchase { 0.00 }
    order_forwarding_number { '+63787878778' }
    business_phone_number { FFaker::PhoneNumberSG.fixed_line_number }
    business_openning_time { '09:30' }
    business_closing_time { '19:00' }
    custom_questions { [] }
    street_number { '2323' }
    route { 'Rizal Avenue' }
    locality { 'Olongapo' }
    administrative_area_level_1 { 'Central Luzon' }
    country { 'Philippines' }
    postal_code { '2200' }
    latitude { 14.8418823 }
    longitude { 120.2875443 }

    trait :with_products do
      after :create do |shop|
        create_list(:product, 3, :with_images, shop: shop)
      end
    end
  end
end
