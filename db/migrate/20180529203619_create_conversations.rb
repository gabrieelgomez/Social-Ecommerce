class CreateConversations < ActiveRecord::Migration[5.1]
  def change
    create_table :conversations do |t|
      t.references :senderable, polymorhic: true
      t.references :recipientable, polymorphic: true
      
      t.timestamps
    end
    add_index :conversations, %i[recipientable_id recipientable_type,
                                 senderable_id senderable_type], unique: true
  end
end
