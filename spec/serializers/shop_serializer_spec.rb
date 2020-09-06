require 'rails_helper'

describe ShopSerializer do
  subject do
    described_class.new(shop).
      serializable_hash.dig(:data, :attributes)
  end

  let(:shop) { create(:shop) }
  let(:expectation) do
    {
      id: shop.id,
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
      business_address: shop.business_address,
      business_phone_number: shop.business_phone_number,
      business_openning_time: shop.business_openning_time,
      business_closing_time: shop.business_closing_time,
      custom_questions: shop.custom_questions
    }
  end

  it { is_expected.to eq expectation }
end
