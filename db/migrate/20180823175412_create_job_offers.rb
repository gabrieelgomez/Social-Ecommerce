class CreateJobOffers < ActiveRecord::Migration[5.1]
  def change
    create_table :job_offers do |t|
      t.string :photo
      t.string :charge
      t.string :location
      t.string :salary
      t.integer :day_rutine_type
      t.integer :job_type
      t.text :details
      t.string :status

      t.timestamps
    end
  end
end
