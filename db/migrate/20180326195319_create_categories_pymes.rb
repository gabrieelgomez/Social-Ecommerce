class CreateCategoriesPymes < ActiveRecord::Migration[5.1]
  def change
    # create_table :categories_pymes, :id => false do |t|
    #   t.references :category
    # end
    #
    # create_table :categories_independents, :id => false do |t|
    #   t.references :category
    # end
    #
    # create_table :categories_sellers, :id => false do |t|
    #   t.references :category
    # end

    create_table :categories_profiles, :id => false do |t|
      t.references :category
      t.references :profile
      t.references :seller
      t.references :independent
      t.references :pyme
    end

    # add_index :categories_pymes, :category_id
    # add_index :categories_pymes, :pyme_id
  end
end
