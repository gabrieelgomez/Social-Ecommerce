class CreateCustomFieldsItems < ActiveRecord::Migration[5.1]
  def change
    create_table :custom_fields_items do |t|
      t.references :item, foreign_key: true
      t.references :custom_field, foreign_key: true
    end
  end
end
