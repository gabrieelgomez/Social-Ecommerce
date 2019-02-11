class CreateWaveWorkAreas < ActiveRecord::Migration[5.1]
  def change
    create_table :wave_work_areas do |t|
      t.string :title
      t.jsonb  :subareas

      t.timestamps
    end
  end
end
