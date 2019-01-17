class CreateIntranetCards < ActiveRecord::Migration[5.1]
  def change
    create_table :intranet_cards do |t|
      t.string :title
      t.text :description
      t.bigint :date_start
      t.bigint :date_end
      t.jsonb :files
      t.boolean :store
      t.belongs_to :intranet
      t.belongs_to :board
      t.belongs_to :list

      t.timestamps
    end
  end
end
