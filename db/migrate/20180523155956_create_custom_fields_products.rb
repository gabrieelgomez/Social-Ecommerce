class CreateCustomFieldsProducts < ActiveRecord::Migration[5.1]
  def change
    create_table :custom_fields_products do |t|
      t.references :custom_field, foreign_key: true
      t.references :product, foreign_key: true
    end
  end
end
