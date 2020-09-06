class Shop < ApplicationRecord
  validates :name, :description, :tags, :order_forwarding_number,
            :business_address, :business_phone_number,:business_openning_time,
            :business_closing_time, presence: true

  has_one_attached  :business_logo
  has_many          :products, dependent: :destroy
  belongs_to        :user

  validates :business_logo, presence: false,
            blob: {
              content_type: ['image/png', 'image/jpg', 'image/jpeg'], size_range: 1..5.megabytes
            }
end
