class AddColumnMetadataToLocations < ActiveRecord::Migration[5.1]
  def change
    add_column :locations, :metadata, :jsonb
    add_column :locations, :title, :string
    add_column :locations, :prominent, :boolean, default: false
  end
end
