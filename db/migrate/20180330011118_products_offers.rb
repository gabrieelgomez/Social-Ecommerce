class ProductsOffers < ActiveRecord::Migration[5.1]
  def change
  	create_table :offers_products, :id => false do |t|
      t.references :product
      t.references :offer
    end
  end
end
