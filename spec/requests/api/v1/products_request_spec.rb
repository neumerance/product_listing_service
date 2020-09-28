require 'rails_helper'

describe "Api::V1::Products", type: :request do
  subject { response }

  let!(:shop) { create(:shop, :with_products) }
  let(:json_response) { JSON.parse(response.body).dig('data') }

  describe '#index' do
    before do
      get '/api/v1/products'
    end

    it { is_expected.to have_http_status(:success) }

    it 'returns products' do
      expect(json_response.any?).to be_truthy
    end

    describe 'search filters' do
      context 'nearby' do
        let!(:new_shop) do
          create(
            :shop, :with_products,
            administrative_area_level_1: nil,
            route: nil,
            locality: nil,
            country: nil,
            latitude: 12.003300,
            longitude: 123.998598
          )
        end

        before do
          get '/api/v1/products', params: {
            search: {
              nearby: {
                lat: 12.003300,
                lon: 123.998598,
                radius: 20
              }
            }
          }
        end

        it { is_expected.to have_http_status(:success) }
        it 'returns products' do
          expect(json_response.map { |p| p['id'].to_i }).to eq new_shop.products.map(&:id)
        end
      end
    end
  end
end
