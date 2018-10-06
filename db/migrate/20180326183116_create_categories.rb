class CreateCategories < ActiveRecord::Migration[5.1]
  def change
    create_table :categories do |t|
      t.string :name
      t.string :cover, default: '', null: false
      t.timestamps
    end
  end
end
