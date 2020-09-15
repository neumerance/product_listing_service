class Api::V1::ShopsController < ApplicationController
  before_action :set_resource, only: [:show, :update, :destroy]

  def show
    respond_with_json
  end

  def create
    @shop = current_user.shops.create(shop_params)
    respond_with_json
  end

  def update
    @shop.update(shop_params)
    respond_with_json
  end

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

  def shop_params
    params.require(:shop).permit(
      :name, :description, [tags: []], :facebook_page_url, :website_url,
      :has_delivery_service, :minimum_purchase, :delivery_fee, :tax_percentage,
      :stop_orders, :order_forwarding_number, :business_phone_number,
      :business_openning_time, :business_closing_time, :custom_questions,
      :latitude, :longitude, :street_number, :route, :locality,
      :administrative_area_level_1, :country, :postal_code
    )
  end
end
