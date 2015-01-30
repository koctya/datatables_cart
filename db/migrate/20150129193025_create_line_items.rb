class CreateLineItems < ActiveRecord::Migration
  def change
    create_table :line_items do |t|
      t.integer :qty, default: 1
      t.references :product, index: true
      t.references :order, index: true

      t.timestamps null: false
    end
    add_foreign_key :line_items, :products
    add_foreign_key :line_items, :orders
  end
end
