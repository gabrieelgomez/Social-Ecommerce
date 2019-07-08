class CreateMembershipConversation < ActiveRecord::Migration[5.1]
  def change
    create_table :membership_conversations do |t|
      t.references :conversation, foreign_key: true
      t.string     :memberable_type, null: false
      t.integer    :memberable_id, null: false
      t.boolean    :open, default: false      
      # t.references :memberable, polymorphic: true, index: true
    end
  end
end
