class CreateCotizationsItems < ActiveRecord::Migration[5.1]
  def change
    create_table :cotizations_items do |t|
      t.references :cotization, foreign_key: true
      t.references :item, foreign_key: true
    end
  end
end
