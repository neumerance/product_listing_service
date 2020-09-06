class Api::V1::ProductsController < ApplicationController
  before_action :set_products, :serialize_products, only: :index

  api :GET, '/v1/products'
  param :search, Hash, desc: 'filter search' do
    param :keywords, String, desc: "Search by product name or shop's name"
    param :nearby, Hash, desc: 'Search nearby' do
      param :lat, Integer, desc: 'Latitude'
      param :lon, Integer, desc: 'Longitude'
    end
  end
  def index
    render json: @serialize_products
  end

  private

  def set_products
    @products = Product.all.preload(:images, :shop)
  end

  def serialize_products
    @serialize_products = ProductSerializer.new(@products)
  end
end
