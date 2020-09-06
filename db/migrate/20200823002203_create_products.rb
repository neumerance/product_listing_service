class CreateProducts < ActiveRecord::Migration[6.0]
  def change
    create_table :products do |t|
      t.string      :name, null: false
      t.text        :description, null: false
      t.decimal     :price, precision: 10, null: false, default: 0
      t.references  :shop
      t.timestamps
    end
  end
end
