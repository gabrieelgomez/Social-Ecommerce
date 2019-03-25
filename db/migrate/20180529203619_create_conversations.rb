class CreateConversations < ActiveRecord::Migration[5.1]
  def change
    create_table :conversations do |t|
      t.references :recipientable, polymorphic: true
      t.references :senderable, polymorphic: true
      t.string     :type_messages, default: '', null: false
      t.boolean    :open, default: false
      t.timestamps
    end
  end
end
