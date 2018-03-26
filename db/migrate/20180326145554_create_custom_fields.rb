class CreateCustomFields < ActiveRecord::Migration[5.1]
  def change
    create_table :custom_fields do |t|
      t.string  :name
      t.integer :product_id

      t.timestamps
    end
  end
end
