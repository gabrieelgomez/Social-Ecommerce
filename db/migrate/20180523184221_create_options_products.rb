class CreateOptionsProducts < ActiveRecord::Migration[5.1]
  def change
    create_table :options_products do |t|
      t.references :option, foreign_key: true
      t.references :product, foreign_key: true
    end
  end
end
