class CreateWaveWorkTypeHierarchies < ActiveRecord::Migration[5.1]
  def change
    create_table :wave_work_type_hierarchies do |t|
      t.string :title

      t.timestamps
    end
  end
end
