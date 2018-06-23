class CreatePhotos < ActiveRecord::Migration[5.1]
  def change
    create_table :photos do |t|
      t.string :photo
      t.references :photoable, polymorphic: true, index: true
      t.timestamps
    end
  end
end
