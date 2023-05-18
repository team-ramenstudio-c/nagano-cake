class CreateItems < ActiveRecord::Migration[6.1]
  def change
    create_table :items do |t|
      t.references :genre, foreign_key: true, null: false
      t.string :name, null: false
      t.text :description, null: false
      t.integer :price_without_tax, null: false
      t.boolean :is_on_sale, null: false, default: true

      t.timestamps
    end
  end
end
