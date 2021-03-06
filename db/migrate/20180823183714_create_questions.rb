class CreateQuestions < ActiveRecord::Migration[5.1]
  def change
    create_table :questions do |t|
      t.text :title,           null: false
      t.text :description,     default: '', null: false
      t.integer :q_type,       default: 0
      t.integer :position
      t.references :job_offer, foreign_key: true

      t.timestamps
    end
  end
end
