class AddColumnOmniauthToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :omniauth_provider, :string
    add_column :users, :omniauth_id, :text
  end
end
