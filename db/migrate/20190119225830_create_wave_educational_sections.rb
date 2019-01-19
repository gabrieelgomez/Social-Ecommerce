class CreateWaveEducationalSections < ActiveRecord::Migration[5.1]
  def change
    create_table :wave_educational_sections do |t|
      t.string :title
      t.text :description
      t.string :status, default: ''
      t.boolean :published, default: false
      t.belongs_to :course

      t.timestamps
    end
  end
end
