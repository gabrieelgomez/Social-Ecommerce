class CreateWaveWorkRequirements < ActiveRecord::Migration[5.1]
  def change
    create_table :wave_work_requirements do |t|
      t.string  :title
      t.jsonb   :sex
      t.integer :start_age, default: 0
      t.integer :end_age, default: 0
      t.text    :address
      t.integer :minimal_experience, default: 0
      t.jsonb   :languages
      t.jsonb   :education_level
      t.float   :start_salary, default: 0
      t.float   :end_salary, default: 0
      t.boolean :request_salary, default: false
      t.belongs_to :job_offer

      t.timestamps
    end
  end
end
