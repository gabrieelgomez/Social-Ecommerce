class CreateCategoriesProducts < ActiveRecord::Migration[5.1]
  def change
    create_table :categories_products, :id => false do |t|
      t.references :category
      t.references :product
    end
    # add_index :categories_products, :category_id
    # add_index :categories_products, :product_id
  end
end
