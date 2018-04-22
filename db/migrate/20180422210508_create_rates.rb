class CreateRates < ActiveRecord::Migration[5.1]
  def change
    create_table :rates do |t|
      t.float :score
      t.references :user, foreign_key: true
      t.references :profile, foreign_key: true

      t.timestamps
    end
  end
end
