class CreateItemsOptions < ActiveRecord::Migration[5.1]
  def change
    create_table :items_options do |t|
      t.references :item, foreign_key: true
      t.references :option, foreign_key: true
    end
  end
end
