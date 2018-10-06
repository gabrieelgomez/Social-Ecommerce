class CreateJobOffers < ActiveRecord::Migration[5.1]
  def change
    create_table :job_offers do |t|
      t.string :photo, default: ''
      t.string :charge, default: ''
      t.string :location, default: ''
      t.string :salary, default: ''
      t.integer :day_rutine_type, default: 0
      t.integer :job_type, default: 0
      t.text :details, default: ''
      t.string :status, default: ''
      t.references :profile, foreign_key: true

      t.timestamps
    end
  end
end
