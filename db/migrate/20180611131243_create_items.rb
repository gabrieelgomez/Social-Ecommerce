class CreateItems < ActiveRecord::Migration[5.1]
  def change
    create_table :items do |t|
      t.references :product, foreign_key: true
      t.references :shopping_cart, foreign_key: true
      t.json       :option_values, default: {}
      t.integer    :quantity, default: 1, null: false
      t.datetime   :deleted_at
    end
  end
end
