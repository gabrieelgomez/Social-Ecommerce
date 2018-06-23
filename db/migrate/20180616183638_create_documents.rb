class CreateDocuments < ActiveRecord::Migration[5.1]
  def change
    create_table :documents do |t|
      # t.references :product, foreign_key: true
      t.references :documentable, polymorphic: true, index: true
      t.string :document

      t.timestamps
    end
  end
end
