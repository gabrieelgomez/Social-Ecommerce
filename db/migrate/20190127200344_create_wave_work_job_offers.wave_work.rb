class CreateWaveWorkJobOffers < ActiveRecord::Migration[5.1]
  def change
    create_table :wave_work_job_offers do |t|
      t.text :title
      t.text :description
      t.string :country
      t.string :state
      t.text :address
      t.integer :vacancies
      t.boolean :copy_cv, default: false
      t.belongs_to :profile
      t.belongs_to :area
      t.belongs_to :type_hierarchy
      t.belongs_to :type_job

      t.timestamps
    end
  end
end
