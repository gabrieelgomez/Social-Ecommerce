class CreateCategoriesProfiles < ActiveRecord::Migration[5.1]
  def change
    create_table :categories_profiles, :id => false do |t|
      t.references :category
      t.references :profile
      t.references :pyme
      t.references :independent
      t.references :seller
    end
  end
end
