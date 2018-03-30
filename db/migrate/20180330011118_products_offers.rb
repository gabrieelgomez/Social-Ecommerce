class ProductsOffers < ActiveRecord::Migration[5.1]
  def change
  	create_table :products_offers, :id => false do |t|
      t.references :product
      t.references :offer
    end
  end
end
