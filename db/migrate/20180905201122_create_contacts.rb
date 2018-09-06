class CreateContacts < ActiveRecord::Migration[5.1]
  def change
    create_table :contacts do |t|
      t.string :name
      t.string :email
      t.string :country
      t.text :comments
      t.string :phone
      t.references :profile, foreign_key: true
      t.references :contact_type, foreign_key: true

      t.timestamps
    end
  end
end
