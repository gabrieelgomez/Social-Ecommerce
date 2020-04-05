class CreateWaveCitizenPolls < ActiveRecord::Migration[5.1]
  def change
    create_table :wave_citizen_polls do |t|
      t.string    :title
      t.text      :description
      t.integer   :citizen_id
      t.integer   :user_id
      t.integer   :poll_category_id
      t.boolean   :available
      t.datetime  :due_date

      t.datetime :deleted_at
      t.timestamps
    end
  end
end
