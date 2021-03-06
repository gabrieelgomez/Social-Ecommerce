class CreatePosts < ActiveRecord::Migration[5.1]
  def change
    create_table :posts do |t|
      t.text       :content
      t.string     :title
      t.string     :banner
      t.references :postable, polymorphic: true

      t.timestamps
    end
  end
end
