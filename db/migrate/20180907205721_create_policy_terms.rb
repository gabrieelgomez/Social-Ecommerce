class CreatePolicyTerms < ActiveRecord::Migration[5.1]
  def change
    create_table :policy_terms do |t|
      t.text :tems
      t.string :file

      t.timestamps
    end
  end
end
