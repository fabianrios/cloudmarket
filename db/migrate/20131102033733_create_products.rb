class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :title
      t.decimal :price
      t.decimal :highprice
      t.string :category
      t.integer :quantity
      t.string :storeName
      t.string :adress

      t.timestamps
    end
  end
end
