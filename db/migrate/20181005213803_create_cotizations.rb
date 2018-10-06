class CreateCotizations < ActiveRecord::Migration[5.1]
  def change
    create_table :cotizations do |t|
      t.references :cotizable, polymorphic: true
      t.references :client, foreign_key: true
      t.integer :deal_type_id
      t.float :price

      t.timestamps
    end
  end
end
