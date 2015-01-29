class CreateLineItems < ActiveRecord::Migration
  def change
    create_table :line_items do |t|
      t.decimal :qty
      t.references :product, index: true

      t.timestamps null: false
    end
    add_foreign_key :line_items, :products
  end
end
