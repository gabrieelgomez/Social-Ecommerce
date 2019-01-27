class CreateWaveEducationalCourses < ActiveRecord::Migration[5.1]
  def change
    create_table :wave_educational_courses do |t|
      t.string :name
      t.text :description
      t.string :lasted_update
      t.string :language
      t.string :status
      t.boolean :private, default: false
      t.boolean :published, default: false
      t.string :price
      t.text :requirements
      t.string :category
      t.belongs_to :teacher
      t.datetime   :deleted_at
      t.timestamps
    end
  end
end
