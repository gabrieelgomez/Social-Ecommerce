class AddColumnComentorToComments < ActiveRecord::Migration[5.1]
  def change
    add_reference :comments, :commentor, polymorphic: true
  end
end
