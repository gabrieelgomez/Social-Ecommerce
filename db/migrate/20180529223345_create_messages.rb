class CreateMessages < ActiveRecord::Migration[5.1]
  def change
    create_table :messages do |t|
      t.text :body
      t.boolean :read
      t.references :conversation, foreign_key: true
      t.string :image
      t.string :file
      t.references :messageable, polymorphic: true

      t.timestamps
    end
  end
end
