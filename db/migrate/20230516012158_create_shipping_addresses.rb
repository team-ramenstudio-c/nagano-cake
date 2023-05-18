class CreateShippingAddresses < ActiveRecord::Migration[6.1]
  def change
    create_table :shipping_addresses do |t|
      t.references :customer, foreign_key: true, null: false
      t.string :name, null: false
      t.string :postal_code, null: false
      t.string :address, null: false

      t.timestamps
    end
  end
end
