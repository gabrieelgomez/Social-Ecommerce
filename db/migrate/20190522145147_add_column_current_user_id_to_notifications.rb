class AddColumnCurrentUserIdToNotifications < ActiveRecord::Migration[5.1]
  def change
    add_column :notifications, :current_user_id, :integer
    add_column :notifications, :current_user_type, :string
  end
end
