class CreateProductsShoppingCars < ActiveRecord::Migration[5.1]
  def change
    create_table :products_shopping_cars do |t|
      t.references :product, foreign_key: true
      t.references :shopping_car, foreign_key: true
    end
  end
end
