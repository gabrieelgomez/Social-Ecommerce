class CreateSubcategoriesProducts < ActiveRecord::Migration[5.1]
  def change
    create_table :subcategories_products do |t|
      t.references :subcategory
      t.references :product
    end
  end
end
