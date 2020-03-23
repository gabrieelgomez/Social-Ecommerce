class CreateWaveCitizenProposalCategories < ActiveRecord::Migration[5.1]
  def change
    create_table :wave_citizen_proposal_categories do |t|
      t.string   :name
      t.belongs_to :country

      t.datetime :deleted_at
      t.timestamps
    end
  end
end
