class AddColumnConversationIdToCotizations < ActiveRecord::Migration[5.1]
  def change
    add_reference :cotizations, :conversation#, foreign_key: true
  end
end
