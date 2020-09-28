class Shop < ApplicationRecord
  validates :description, :tags, :order_forwarding_number,
            :business_openning_time, :business_closing_time,
            presence: true
  validates :name, :business_phone_number,
            uniqueness: true, presence: true
  validates :business_logo, presence: false,
            blob: {
              content_type: ['image/png', 'image/jpg', 'image/jpeg'],
              size_range: 1..5.megabytes
            }

  has_one_attached  :business_logo
  has_many          :products, dependent: :destroy
  belongs_to        :user

  attr_accessor :address

  geocoded_by :address

  def address
    [
      street_number, route, locality,
      administrative_area_level_1, country, postal_code
    ].compact.join(' ').strip
  end
end
