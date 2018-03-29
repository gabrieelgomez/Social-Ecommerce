class CreatePriceRanges < ActiveRecord::Migration[5.1]
  def change
    create_table :price_ranges do |t|
      t.integer :stock, default: 1
      t.float :price
      t.references :product, foreign_key: true

      t.timestamps
    end
  end
end
