class AddColumnOpenToConversations < ActiveRecord::Migration[5.1]
  def change
    add_column :conversations, :open, :boolean, default: false
  end
end
