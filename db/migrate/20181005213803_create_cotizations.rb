class CreateCotizations < ActiveRecord::Migration[5.1]
  def change
    create_table :cotizations do |t|
      t.references :cotizable, polymorphic: true
      t.references :client, foreign_key: true
      t.integer    :deal_type_id
      t.float      :price
      t.boolean    :status, default: true
      t.string     :stage, default: 'sent'
      t.string     :details, default: ''
      t.string     :token, default: ''
      t.string     :currency, default: 'usd'
      t.text       :address, :text, default: ''

      t.timestamps
    end
  end
end
