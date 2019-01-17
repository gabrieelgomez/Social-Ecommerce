# This migration comes from intranet (originally 20181207160427)
class CreateIntranetMemberships < ActiveRecord::Migration[5.1]
  def change
    create_table :intranet_memberships do |t|
      t.belongs_to :user
      t.belongs_to :group
      t.belongs_to :intranet
      t.belongs_to :profile

      t.timestamps
    end
  end
end
