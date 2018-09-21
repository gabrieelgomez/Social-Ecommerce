class CreatePolicyTerms < ActiveRecord::Migration[5.1]
  def change
    create_table :policy_terms do |t|
      t.text :terms, default: '', null: false
      t.string :file, default: '', null: false

      t.timestamps
    end
  end
end
