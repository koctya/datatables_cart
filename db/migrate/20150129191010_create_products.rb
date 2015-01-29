class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :name
      t.text :desc
      t.string :img_url
      t.decimal :price, precision: 8, scale: 2

      t.timestamps null: false
    end
  end
end
