class CreateIntranetTasks < ActiveRecord::Migration[5.1]
  def change
    create_table :intranet_tasks do |t|
      t.string     :title
      t.boolean    :completed
      t.belongs_to :checklist

      t.timestamps
    end
  end
end
