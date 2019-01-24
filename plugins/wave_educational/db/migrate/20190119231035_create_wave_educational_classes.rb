class CreateWaveEducationalClasses < ActiveRecord::Migration[5.1]
  def change
    create_table :wave_educational_classes do |t|
      t.string :title
      t.text :description
      t.text :content
      t.string :status, default: ''
      t.boolean :published, default: false
      t.belongs_to :section
      t.datetime   :deleted_at
      
      t.timestamps
    end
  end
end
