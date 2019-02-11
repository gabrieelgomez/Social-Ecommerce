class CreateWaveWorkExams < ActiveRecord::Migration[5.1]
  def change
    create_table :wave_work_exams do |t|
      t.string   :title
      t.text     :description
      t.integer  :examenable_id
      t.string   :examenable_type
      t.datetime :deleted_at

      t.timestamps
    end
  end
end
