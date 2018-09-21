class AddColumnCoverToCategories < ActiveRecord::Migration[5.1]
  def change
    add_column :categories, :cover, :string, default: '', null: false
  end
end
