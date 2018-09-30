class CreateClients < ActiveRecord::Migration[5.1]
  def change
    create_table :clients do |t|
      t.references :clientable, polymorphic: true
      t.references :ownerable,  polymorphic: true
      t.string :name,           default: ''
      t.string :lastname,       default: ''
      t.string :email,          default: ''
      t.string :avatar,         default: ''
      t.string :dni,            default: ''
      t.string :phone,          default: ''
      t.text   :description,    default: ''
      t.integer :created_by,    default: 0

      t.timestamps
    end
  end
end
