class Api::V1::ShopsController < ApplicationController

  def create
    @current_user.shops.create(shop_params)
  end

  def update
  end

  private

  def shop_params
    params.require(:shop).permit(
      :name, :description, :tags, :facebook_page_url, :website_url,
      :has_delivery_service, :minimum_purchase, :delivery_fee, :tax_percentage,
      :stop_orders, :order_forwarding_number, :business_phone_number,
      :business_openning_time, :business_closing_time, :custom_questions,
      :latitude, :longitude, :street_number, :route, :locality:,
      :administrative_area_level_1, :country, :postal_code
    )
  end
end
