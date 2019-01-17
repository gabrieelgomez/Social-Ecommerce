class CreateIntranetBoards < ActiveRecord::Migration[5.1]
  def change
    create_table :intranet_boards do |t|
      t.string :name
      t.text :description
      t.belongs_to :intranet

      t.timestamps
    end
  end
end
