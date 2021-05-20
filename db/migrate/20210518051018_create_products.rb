class CreateProducts < ActiveRecord::Migration[5.0]
  def change
    create_table :products do |t|

      t.string :name
      t.text :description
      t.string :image_id
      t.integer :price
      t.boolean :is_active
      t.integer :genre_id
      t.timestamps
    end
  end
end
