class CreateSavedOffers < ActiveRecord::Migration[5.1]
  def change
    create_table :saved_offers do |t|
      t.references :user, foreign_key: true
      t.references :offer, foreign_key: true
      t.text :description
    end
  end
end
