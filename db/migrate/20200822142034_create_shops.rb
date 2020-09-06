class CreateShops < ActiveRecord::Migration[6.0]
  def change
    create_table :shops do |t|
      t.string      :name, null: false, index: true, unique: true
      t.text        :description, null: false
      t.string      :tags, array: true, default: []
      t.string      :facebook_page_url
      t.string      :website_url
      t.boolean     :has_delivery_service, default: false
      t.decimal     :minimum_purchase, precision: 10, default: 0
      t.decimal     :delivery_fee, precision: 10, default: 0
      t.integer     :tax_percentage, default: 0
      t.boolean     :stop_orders, default: false
      t.string      :order_forwarding_number
      t.string      :business_phone_number, null: false, unique: true
      t.string      :business_openning_time, null: false
      t.string      :business_closing_time, null: false
      t.string      :custom_questions, array: true, default: []
      t.float       :latitude
      t.float       :longitude
      t.string      :street_number
      t.string      :route
      t.string      :locality
      t.string      :administrative_area_level_1
      t.string      :country
      t.string      :postal_code
      t.references  :user
      t.timestamps
    end

    add_index :shops, [:latitude, :longitude]
  end
end
