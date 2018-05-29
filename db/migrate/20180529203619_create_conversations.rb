class CreateConversations < ActiveRecord::Migration[5.1]
  def change
    create_table :conversations do |t|
      t.references :senderable, polymorhic: true, foreign_key: true
      t.references :recipientable, polymorphic: true

      t.timestamps
    end
  end
end
