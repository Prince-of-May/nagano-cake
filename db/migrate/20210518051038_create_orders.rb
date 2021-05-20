class CreateOrders < ActiveRecord::Migration[5.0]
  def change
    create_table :orders do |t|

      t.integer :shipping_cost
      t.integer :total_payment
      t.integer :payment_method
      t.string :address
      t.string :postal_code
      t.string :name
      t.integer :status
      t.integer :customer_id

      t.timestamps
    end
  end
end
