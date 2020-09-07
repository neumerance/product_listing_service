class ShopSerializer
  include FastJsonapi::ObjectSerializer
  attributes  :name, :description, :tags, :facebook_page_url, :website_url,
              :has_delivery_service, :minimum_purchase, :delivery_fee, :tax_percentage,
              :stop_orders, :order_forwarding_number, :business_phone_number,
              :business_openning_time, :business_closing_time, :custom_questions,
              :latitude, :longitude, :street_number, :route, :locality:,
              :administrative_area_level_1, :country, :postal_code
end
