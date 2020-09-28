class Api::V1::ProductsController < ApplicationController
  before_action :nearby_shops,
                :product_tags,
                :set_products,
                :serialize_products, only: :index

  api :GET, '/v1/products'
  param :search, Hash, desc: 'filter search' do
    param :keywords, String, desc: "Search by product name or shop's name"
    param :nearby, Hash, desc: 'Search nearby' do
      param :lat, String, desc: 'Latitude', required: true
      param :lon, String, desc: 'Longitude', required: true
      param :radius, String, desc: 'Radial width by kilometers', required: true
    end
    param :tags, Array, desc: 'Array string of product tags'
  end
  def index
    render json: @serialize_products
  end

  private

  def set_products
    @products = Product.preload(:images, :shop).all
    @products = @products.where(shop_id: nearby_shops.map(&:id)) if nearby_shops.any?
    @products = @products.where('tags && ?', "{#{product_tags.join(',')}}") if product_tags.any?
    @products
  end

  def serialize_products
    @serialize_products = ProductSerializer.new(@products)
  end

  def nearby_shops
    return [] if params.dig(:search, :nearby, :lat).blank? ||
                 params.dig(:search, :nearby, :lon).blank? ||
                 params.dig(:search, :nearby, :radius).blank?

    coordinates = params.dig(:search, :nearby)
    @nearby_shops = Shop.near(
      [coordinates.dig(:lat).to_f, coordinates.dig(:lon).to_f],
      coordinates.dig(:radius).to_i
    ).select(:id)
  end

  def product_tags
    return [] unless params[:product_tags].present?
   @product_tags = params[:tags]
  end
end
