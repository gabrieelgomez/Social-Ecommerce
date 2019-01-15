class AddColumnStageToCotizations < ActiveRecord::Migration[5.1]
  def change
    add_column :cotizations, :stage, :string, default: 'received'
    add_column :cotizations, :details, :string, default: ''
    add_column :cotizations, :token, :string, default: ''
    add_column :cotizations, :currency, :string, default: 'usd'
    add_column :cotizations, :address, :text, default: ''
  end
end
