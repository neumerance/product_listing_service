require 'rails_helper'

describe ShopSerializer do
  subject do
    described_class.new(shop).
      serializable_hash.dig(:data, :attributes)
  end

  let(:shop) { create(:shop) }
  let(:expectation) do
    {
      name: shop.name,
      description: shop.description,
      tags: shop.tags,
      facebook_page_url: shop.facebook_page_url,
      website_url: shop.website_url,
      has_delivery_service: shop.has_delivery_service,
      minimum_purchase: shop.minimum_purchase,
      delivery_fee: shop.delivery_fee,
      tax_percentage: shop.tax_percentage,
      stop_orders: shop.stop_orders,
      order_forwarding_number: shop.order_forwarding_number,
      business_phone_number: shop.business_phone_number,
      business_openning_time: shop.business_openning_time,
      business_closing_time: shop.business_closing_time,
      custom_questions: shop.custom_questions,
      latitude: shop.latitude,
      longitude: shop.longitude,
      street_number: shop.street_number,
      route: shop.route,
      locality: shop.locality,
      administrative_area_level_1: shop.administrative_area_level_1,
      country: shop.country,
      postal_code: shop.postal_code
    }
  end

  it { is_expected.to eq expectation }
end
