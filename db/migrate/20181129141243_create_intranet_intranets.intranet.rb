# This migration comes from intranet (originally 20181129135757)
class CreateIntranetIntranets < ActiveRecord::Migration[5.1]
  def change
    create_table :intranet_intranets do |t|
      t.string     :title
      t.boolean    :status, default: false
      t.references :profile, foreign_key: true

      t.timestamps
    end
  end
end
