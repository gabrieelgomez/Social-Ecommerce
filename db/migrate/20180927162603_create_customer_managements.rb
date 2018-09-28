class CreateCustomerManagements < ActiveRecord::Migration[5.1]
  def change
    create_table :customer_managements do |t|
      t.references :profile, foreign_key: true
      t.string :state, default: 'inactive'

      t.timestamps
    end
  end
end
