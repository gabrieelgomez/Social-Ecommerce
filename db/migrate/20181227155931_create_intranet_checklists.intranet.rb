class CreateIntranetChecklists < ActiveRecord::Migration[5.1]
  def change
    create_table :intranet_checklists do |t|
      t.string     :title
      t.bigint     :date_start
      t.bigint     :date_end
      t.belongs_to :card

      t.timestamps
    end
  end
end
