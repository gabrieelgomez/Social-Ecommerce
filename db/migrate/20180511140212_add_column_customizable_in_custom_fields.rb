class AddColumnCustomizableInCustomFields < ActiveRecord::Migration[5.1]
  def change
    add_column :custom_fields, :customizable_id, :integer, polymorphic: true
    add_column :custom_fields, :customizable_type, :string, polymorphic: true
  end
end
