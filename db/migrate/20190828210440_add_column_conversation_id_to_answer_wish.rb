class AddColumnConversationIdToAnswerWish < ActiveRecord::Migration[5.1]
  def change
    add_column :answer_wishes, :conversation_id, :integer
  end
end
