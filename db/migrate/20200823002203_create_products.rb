class CreateProducts < ActiveRecord::Migration[6.0]
  def up
    create_table :products do |t|
      t.string      :name, null: false
      t.text        :description, null: false
      t.decimal     :price, precision: 10, null: false, default: 0
      t.references  :shop
      t.timestamps
    end
  end

  def down
    drop_table :products
  end
end
