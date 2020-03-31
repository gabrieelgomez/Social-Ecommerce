class CreateWaveCitizenProposals < ActiveRecord::Migration[5.1]
  def change
    create_table :wave_citizen_proposals do |t|
      t.string    :title
      t.text      :description
      t.integer   :citizen_id
      t.integer   :user_id
      t.integer   :proposal_category_id

      t.datetime :deleted_at
      t.timestamps
    end
  end
end
