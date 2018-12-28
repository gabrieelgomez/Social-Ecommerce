class CreateIntranetLists < ActiveRecord::Migration[5.1]
  def change
    create_table :intranet_lists do |t|
      t.string :title
      t.text :description
      t.text :date_start
      t.text :date_end
      t.jsonb :files
      t.boolean :store
      t.belongs_to :board

      t.timestamps
    end
  end
end
