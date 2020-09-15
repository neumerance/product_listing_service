class Api::V1::ProductsController < ApplicationController
  before_action :set_products,
                :serialize_products,
                :nearby_shops,
                :product_tags, only: :index

  api :GET, '/v1/products'
  param :search, Hash, desc: 'filter search' do
    param :keywords, String, desc: "Search by product name or shop's name"
    param :nearby, Hash, desc: 'Search nearby' do
      param :lat, Integer, desc: 'Latitude', required: true
      param :lon, Integer, desc: 'Longitude', required: true
      param :radius, Integer, desc: 'Radial width by kilometers', required: true
    end
    param :tags, Array, desc: 'Array string of product tags'
  end
  def index
    render json: @serialize_products
  end

  private

  def set_products
    @products = Product.all.preload(:images, :shop)
    @products.where(shop: @nearby_shops) if @nearby_shops.present?
    @products.where(tags: @product_tags) if @product_tags.present?
  end

  def serialize_products
    @serialize_products = ProductSerializer.new(@products)
  end

  def nearby_shops
    return if params.dig(:nearby, :lat).blank? ||
              params.dig(:nearby, :lon).blank? ||
              params.dig(:nearby, :radius).blank?

    coordinates = params[:nearby]
    @nearby_shops = Shop.near(
      [coordinates[:lot], coordinates[:lon]],
      coordinates[:radius]
    )
  end

  def product_tags
    @product_tags = params[:tags] if params[:product_tags].present?
  end
end
