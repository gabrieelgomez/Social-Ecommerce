class CreateConversations < ActiveRecord::Migration[5.1]
  def change
    create_table :conversations do |t|
      t.references :senderable, polymorhic: true
      t.references :recipientable, polymorphic: true
      t.timestamps
    end
    # add_index :conversations, :recipientable_id
    # add_index :conversations, :recipientable_type
    # add_index :conversations, :senderable_id
    # add_index :conversations, :senderable_type
    # add_index :conversations, :senderable_id
    # add_index :conversations, :recipientable
    # add_index :conversations, %i[recipientable_id recipientable_type,
    #                              senderable_id senderable_type], unique: true
    # add_index :conversations, %i[recipientable senderable]]
  end
end
