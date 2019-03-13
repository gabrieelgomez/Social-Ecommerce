class AddColumnLocationProminentToProfiles < ActiveRecord::Migration[5.1]
  def change
    add_column :profiles, :location_prominent, :boolean, default: false
  end
end
