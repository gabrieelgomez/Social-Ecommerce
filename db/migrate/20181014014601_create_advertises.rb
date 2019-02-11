class CreateAdvertises < ActiveRecord::Migration[5.1]
  def change
    create_table :advertises do |t|
      t.text    :advertisable_type, array: true, default: []
      t.string  :cover,           default: ''
      t.text    :images,            array: true, default: []
      t.string  :status,          default: '', null: false
      t.integer :creator_id,     null: false
      t.bigint  :seen_count,      default: 0, null: false
      t.jsonb   :clicked_count,    default: []
      t.float   :budget,           default: 1, null: false

      t.timestamps
    end
    add_index :advertises, :creator_id
  end
end
