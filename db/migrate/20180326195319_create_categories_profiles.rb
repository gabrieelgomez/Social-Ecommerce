class CreateCategoriesProfiles < ActiveRecord::Migration[5.1]
  def change
    create_table :categories_profiles, :id => false do |t|
      t.references :category
      t.references :profile
      t.references :seller
      t.references :independent
      t.references :pyme
    end

    # add_index :categories_profiles, :category_id
    # add_index :categories_profiles, :profile_id
  end
end
