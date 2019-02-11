class CreateWaveWorkTypeQuestions < ActiveRecord::Migration[5.1]
  def change
    create_table :wave_work_type_questions do |t|
      t.string     :title
      t.string     :question_type
      t.text       :description
      t.text       :question
      t.text       :open_answer
      t.json       :alternative_answer
      t.boolean    :boolean_answer
      t.belongs_to :exam
      t.datetime   :deleted_at

      t.timestamps
    end
  end
end
