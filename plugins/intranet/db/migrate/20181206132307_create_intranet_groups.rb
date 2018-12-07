class CreateIntranetGroups < ActiveRecord::Migration[5.1]
  def change
    create_table :intranet_groups do |t|
      t.string :title
      t.text :subtitle
      t.text :description
      t.string :banner
      t.string :cover
      t.belongs_to :intranet

      t.timestamps
    end
  end
end
