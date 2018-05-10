class AddColumnProfileIdInCustomFields < ActiveRecord::Migration[5.1]
  def change
    add_column :custom_fields, :profile_id, :integer
  end
end
