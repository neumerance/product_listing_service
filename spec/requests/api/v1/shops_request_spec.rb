require 'rails_helper'

describe Api::V1::ShopsController, type: :request do
  subject { response }

  let(:user) { create(:user) }
  let(:json_response) { JSON.parse(response.body).dig('data') }

  describe '#show' do
    before do
      sign_in user
      get "/api/v1/shops/#{shop.id}"
    end

    let(:shop) { create(:shop, user: user) }

    it { is_expected.to have_http_status(:success) }
    it 'returns shop' do
      expect(json_response.dig('id')).to eq shop.id.to_s
    end
  end

  describe '#create' do
    before do
      sign_in user
      post "/api/v1/shops", params: {
        shop: shop_attributes
      }
    end

    let(:shop_attributes) { build(:shop).attributes }

    it 'returns shop' do
      expect(response).to have_http_status :success
      expect(json_response.dig('id')).not_to be_blank
    end
  end

  describe '#update' do
    let(:shop) { create(:shop, user: user) }

    before do
      sign_in user
      put "/api/v1/shops/#{shop.id}", params: {
        shop: { name: "updated name" }
      }
    end

    it 'updates shop' do
      expect(response).to have_http_status :success
      expect(json_response.dig('attributes', 'name')).to eq 'updated name'
    end
  end

  describe '#destroy' do
    let(:shop) { create(:shop, user: user) }

    before do
      sign_in user
      delete "/api/v1/shops/#{shop.id}"
    end

    it 'destroys the shop' do
      expect(Shop.find_by_id(shop.id)).not_to be_present
    end
  end
end
