class Api::V1::ShopsController < ApplicationController
  before_action :set_resource, only: [:show, :update, :destroy]

  api :GET, '/v1/shops/:id'
  param :id, String, desc: 'Shop ID'
  def show
    respond_with_json
  end

  api :POST, '/v1/shops'
  param :shop, Hash, desc: 'Attributes for shop', required: true do
    param :name, String, desc: 'Name of the store', required: true
    param :description, String, desc: 'A brief description of the store', required: true
    param :tags, Array, desc: 'Array of searchable tags for the store', required: true
    param :facebook_page_url , String, desc: 'Facebook page', required: false
    param :website_url, String, desc: 'Website url of the store if any', required: false
    param :has_delivery_service, [true, false, 'true', 'false'], desc: 'If the store has delivery service', required: true
    param :minimum_purchase, String, desc: 'Minimum purchase for delivery', required: false
    param :tax_percentage, String, desc: 'Tax percentage applied per item', required: false
    param :stop_orders, [true, false, 'true', 'false'], desc: 'Indicates if the store are able to accept orders', required: false
    param :order_forwarding_number, String, desc: 'Phone number where the order will be sent to', required: true
    param :business_phone_number, String, desc: 'Store phone number', required: true
    param :business_openning_time, String, desc: 'Store openning hours in hh:mm 24 hour format', required: true
    param :business_closing_time, String, desc: 'Store closing hours in hh:mm 24 hour format', required: true
    param :custom_questions, Array, desc: 'Question set by the store for the customer', required: false
    param :latitude, String, desc: 'Store location latitude coordinates filled by google address api', required: true
    param :longitude, String, desc: 'Store location longitude coordinates filled by google address api', required: true
    param :street_number, String, desc: 'Store street number fill by google address api', required: false
    param :route, String, desc: 'Store location street/avenue/road filled by google address api', required: false
    param :locality, String, desc: 'Store location city filled by google address api', required: true
    param :administrative_area_level_1, String, desc: 'Store location state filled by google address api', required: false
    param :country, String, desc: 'Store location country filled by google address api', required: false
    param :postal_code, String, desc: 'Store location postal code filled by google address api', required: false
  end
  def create
    @shop = current_user.shops.create(new_shop_params)
    respond_with_json
  end

  api :PUT, '/v1/shops/:id'
  param :shop, Hash, desc: 'Attributes for shop' do
    param :description, String, desc: 'A brief description of the store', required: true
    param :tags, Array, desc: 'Array of searchable tags for the store', required: true
    param :facebook_page_url , String, desc: 'Facebook page', required: false
    param :website_url, String, desc: 'Website url of the store if any', required: false
    param :has_delivery_service, [true, false, 'true', 'false'], desc: 'If the store has delivery service', required: true
    param :minimum_purchase, String, desc: 'Minimum purchase for delivery', required: false
    param :tax_percentage, String, desc: 'Tax percentage applied per item', required: false
    param :stop_orders, [true, false, 'true', 'false'], desc: 'Indicates if the store are able to accept orders', required: false
    param :order_forwarding_number, String, desc: 'Phone number where the order will be sent to', required: true
    param :business_phone_number, String, desc: 'Store phone number', required: true
    param :business_openning_time, String, desc: 'Store openning hours in hh:mm 24 hour format', required: true
    param :business_closing_time, String, desc: 'Store closing hours in hh:mm 24 hour format', required: true
    param :custom_questions, Array, desc: 'Question set by the store for the customer', required: false
    param :latitude, String, desc: 'Store location latitude coordinates filled by google address api', required: true
    param :longitude, String, desc: 'Store location longitude coordinates filled by google address api', required: true
    param :street_number, String, desc: 'Store street number fill by google address api', required: false
    param :route, String, desc: 'Store location street/avenue/road filled by google address api', required: false
    param :locality, String, desc: 'Store location city filled by google address api', required: true
    param :administrative_area_level_1, String, desc: 'Store location state filled by google address api', required: false
    param :country, String, desc: 'Store location country filled by google address api', required: false
    param :postal_code, String, desc: 'Store location postal code filled by google address api', required: false
  end
  def update
    @shop.update(update_shop_params)
    respond_with_json
  end

  api :DELETE, '/v1/shops/:id'
  def destroy
    @shop.destroy
    render json: :ok
  end

  private

  def respond_with_json
    render json: ShopSerializer.new(@shop)
  end

  def set_resource
    @shop = current_user.shops.find(params[:id])
  end

  def new_shop_params
    params.require(:shop).permit(
      :name, :description, [tags: []], :facebook_page_url, :website_url,
      :has_delivery_service, :minimum_purchase, :delivery_fee, :tax_percentage,
      :stop_orders, :order_forwarding_number, :business_phone_number,
      :business_openning_time, :business_closing_time, :custom_questions,
      :latitude, :longitude, :street_number, :route, :locality,
      :administrative_area_level_1, :country, :postal_code
    )
  end

  def update_shop_params
    new_shop_params.except(:name)
  end
end
