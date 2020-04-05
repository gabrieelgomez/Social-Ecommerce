class CreateWaveCitizenItems < ActiveRecord::Migration[5.1]
  def change
    create_table :wave_citizen_items do |t|
      t.string     :title
      t.text       :description
      t.belongs_to :poll

      t.datetime :deleted_at
      t.timestamps
    end
  end
end
