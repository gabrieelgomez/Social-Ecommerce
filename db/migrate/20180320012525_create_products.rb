class CreateProducts < ActiveRecord::Migration[5.1]
  def change
    create_table :products do |t|
      t.string  :name
      t.text    :description, default: ''
      t.boolean :rate
      t.integer :weight
      t.integer :height
      t.integer :width
      t.json    :files
      t.float   :price
      t.string  :service_type
      t.string  :cover
      # t.json    :images
      # t.json    :fields
      t.text    :product_relations, array: true, default: []
      t.string  :tags, default: ''
      t.boolean :prominent
      t.string :service_type
      t.boolean :virtual_product
      # t.integer :productable_id
      # t.string :productable_type
      t.float :stock, default: 0
      t.boolean :status, default: true
      t.string :num_ref, default: ''
      t.string :bar_code, default: ''
      t.string :brand, default: ''
      t.string :currency, default: ''
      t.belongs_to :productable, polymorphic: true

      t.timestamps
    end
    add_index :products, [:productable_id, :productable_type]
  end
end
