class AddColumnOpenToMembershipConversations < ActiveRecord::Migration[5.1]
  def change
    add_column :membership_conversations, :open, :boolean, default: false
  end
end
