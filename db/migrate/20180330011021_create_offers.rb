class CreateOffers < ActiveRecord::Migration[5.1]
  def change
    create_table :offers do |t|
      t.string     :title
      t.text       :description
      t.date       :start_time
      t.date       :end_time
      t.boolean    :state, default: false
      t.float      :price
      t.integer    :stock
      t.text       :condition
      t.text       :included
      t.references :user, foreign_key: true
      t.timestamps
    end
  end
end
# 08803618639
