class CreateWaveCitizenVotes < ActiveRecord::Migration[5.1]
  def change
    create_table :wave_citizen_votes do |t|
      t.boolean    :vote #only for up down vote usage, not for like unlike feature.
      t.references :votable, :polymorphic => true
      t.references :user
      t.references :poll
      t.timestamps null: false
    end

    #user table reference added.
    add_index :wave_citizen_votes, [:user_id, :votable_id, :votable_type, :poll_id], unique: true, name: "wcv_votables"
  end
end
