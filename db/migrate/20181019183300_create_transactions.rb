class CreateTransactions < ActiveRecord::Migration[5.1]
  def change
    create_table :transactions do |t|
      t.float :amount
      t.text :reference
      t.string :type_transfer
      t.string :status
      t.references :coin, foreign_key: true
      t.references :user, foreign_key: true
      t.references :wallet, foreign_key: true

      t.timestamps
    end
  end
end
