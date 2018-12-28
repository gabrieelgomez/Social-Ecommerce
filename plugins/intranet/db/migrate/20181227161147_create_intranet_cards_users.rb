class CreateIntranetCardsUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :intranet_cards_users do |t|
      t.references :card
      t.references :user
    end
  end
end
