class CreatePostulationsQuestions < ActiveRecord::Migration[5.1]
  def change
    create_table :postulations_questions do |t|
      t.references :question, foreign_key: true
      t.references :postulation, foreign_key: true
      t.string :answer
    end
  end
end
