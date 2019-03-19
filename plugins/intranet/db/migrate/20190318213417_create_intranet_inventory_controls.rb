class CreateIntranetInventoryControls < ActiveRecord::Migration[5.1]
  def change
    create_table :intranet_inventory_controls do |t|
      t.boolean :status, default: false
      t.belongs_to :intranet

      t.timestamps
    end
  end
end
