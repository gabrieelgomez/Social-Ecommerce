class CreateProductsSubcategories < ActiveRecord::Migration[5.1]
  def change
    create_table :products_subcategories do |t|
      t.references :subcategory
      t.references :product
    end
  end
end
