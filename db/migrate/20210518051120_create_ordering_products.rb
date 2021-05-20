class CreateOrderingProducts < ActiveRecord::Migration[5.0]
  def change
    create_table :ordering_products do |t|

      t.integer :amount
      t.integer :price
      t.integer :making_status
      t.integer :order_id
      t.integer :product_id


      t.timestamps
    end
  end
end
