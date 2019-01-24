class CreateWaveEducationalExams < ActiveRecord::Migration[5.1]
  def change
    create_table :wave_educational_exams do |t|
      t.string :title
      t.text :description
      # t.belongs_to :examenable, polymorphic: true
      t.integer :examenable_id
      t.string  :examenable_type
      t.datetime   :deleted_at

      t.timestamps
    end
  end
end
