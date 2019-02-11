class CreateOptions < ActiveRecord::Migration[5.1]
  def change
    create_table :options do |t|
      t.string     :name
      t.json       :values
      t.integer    :product_id
      t.belongs_to :optionable, polymorphic: true
      t.timestamps
    end
  end
end
