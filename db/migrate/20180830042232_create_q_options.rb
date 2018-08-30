class CreateQOptions < ActiveRecord::Migration[5.1]
  def change
    create_table :q_options do |t|
      t.string :name
      t.integer :position
      t.references :question, foreign_key: true

      t.timestamps
    end
  end
end
