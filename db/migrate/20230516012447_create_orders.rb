class CreateOrders < ActiveRecord::Migration[6.1]
  def change
    create_table :orders do |t|
      t.references :customer, foreign_key: true, null: false
      t.integer :postage, null: false
      t.integer :billing_amount, null: false
      t.integer :payment_method, null: false, default: 0
      t.string :shipping_name, null: false
      t.string :shipping_post_code, null: false
      t.string :shipping_address, null: false
      t.integer :status, null: false, default: 0

      t.timestamps
    end
  end
end
