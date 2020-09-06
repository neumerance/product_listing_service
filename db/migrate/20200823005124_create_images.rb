class CreateImages < ActiveRecord::Migration[6.0]
  def up
    create_table :images do |t|
      t.string      :imageable_type, null: false
      t.string      :imageable_id, null: false
      t.timestamps
    end

    add_index :images, [:imageable_type, :imageable_id]
  end

  def down
    remove_index :images, [:imageable_type, :imageable_id]
    drop_table :images
  end
end
