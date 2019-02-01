class AddColumnDataStringfyToShoppingCarts < ActiveRecord::Migration[5.1]
  def change
    add_column :shopping_carts, :data_stringfy, :text, default: ''
    add_column :shopping_carts, :data_json, :jsonb, default: {}
  end
end
