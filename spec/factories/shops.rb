FactoryBot.define do
  factory :shop do
    association :user
    name { FFaker::Company.name }
    description { FFaker::Lorem.paragraph }
    tags { ['fastfood', 'food'] }
    order_forwarding_number { '+63092377877878' }
    business_address { FFaker::Address.street_address }
    business_phone_number { '+63092377877878' }
    business_openning_time { '09:30' }
    business_closing_time { '19:00' }
  end
end
