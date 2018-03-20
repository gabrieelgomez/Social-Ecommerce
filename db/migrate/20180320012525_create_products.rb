class CreateProducts < ActiveRecord::Migration[5.1]
  def change
    create_table :products do |t|
      t.boolean :rate
      t.integer :weight
      t.integer :height
      t.integer :width
      t.json :files
      t.json :images
      t.integer :price
      t.json :fields
      # t.integer :productable_id
      # t.string :productable_type
      t.belongs_to :productable, polymorphic: true

      t.timestamps
    end
    add_index :products, [:productable_id, :productable_type]
  end
end
