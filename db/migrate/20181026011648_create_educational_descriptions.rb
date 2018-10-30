class CreateEducationalDescriptions < ActiveRecord::Migration[5.1]
  def change
    create_table :educational_descriptions do |t|
      t.string :institution
      t.string :degree
      t.text :academic_discipline
      t.string :note
      t.text :activities_groups
      t.string :start_date
      t.string :end_date
      t.boolean :current
      t.text :description
      t.jsonb :files
      t.references :educationable, polymorphic: true, index: {name: 'educationable_id'}

      t.timestamps
    end
  end
end
