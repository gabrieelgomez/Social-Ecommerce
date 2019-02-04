class CreateWaveEducationalCourseMemberships < ActiveRecord::Migration[5.1]
  def change
    create_table :wave_educational_course_memberships do |t|
      t.boolean :locked_by_teacher, default: false
      t.boolean :annulled_by_user, default: false
      t.string :status, default: ''
      t.boolean :subscribed, default: true
      t.belongs_to :user
      t.belongs_to :course

      t.timestamps
    end
  end
end
