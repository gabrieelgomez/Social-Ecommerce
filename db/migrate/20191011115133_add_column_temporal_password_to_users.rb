class AddColumnTemporalPasswordToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :temporal_password, :string, default: SecureRandom.hex(3)
  end
end
