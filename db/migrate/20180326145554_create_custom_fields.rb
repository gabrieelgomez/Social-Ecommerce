class CreateCustomFields < ActiveRecord::Migration[5.1]
  def change
    create_table :custom_fields do |t|
      t.string  :name
      t.string  :value
      t.integer :product_id
      t.belongs_to :customizable, polymorphic: true
      t.timestamps
    end
  end
end
