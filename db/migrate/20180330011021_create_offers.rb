class CreateOffers < ActiveRecord::Migration[5.1]
  def change
    create_table :offers do |t|
      t.string :title
      t.text :description
      t.date :start_time
      t.date :end_time

      t.timestamps
    end
  end
end
