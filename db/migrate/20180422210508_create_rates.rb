class CreateRates < ActiveRecord::Migration[5.1]
  def change
    create_table :rates do |t|
      t.float      :score
      t.references :user, foreign_key: true
      t.belongs_to :rateable, polymorphic: true

      t.timestamps
    end
  end
end
