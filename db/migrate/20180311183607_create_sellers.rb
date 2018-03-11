class CreateSellers < ActiveRecord::Migration[5.1]
  def change
    create_table :sellers do |t|
      t.integer  :profile_id
      t.integer  :user_id
      t.timestamps
    end
  end
end
