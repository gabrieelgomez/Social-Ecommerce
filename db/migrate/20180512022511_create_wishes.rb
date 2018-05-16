class CreateWishes < ActiveRecord::Migration[5.1]
  def change
    create_table :wishes do |t|
      t.references :user, foreign_key: true
      t.string     :name, default: ''
      t.float      :budget, default: 0
      t.string     :priority, default: 'low'
      t.boolean    :response, default: false
      t.boolean    :sent,     default: false
      t.text       :description, default: ''
      t.references :wisheable, polymorphic: true
      t.datetime :deleted_at
      t.timestamps
    end
  end
end
