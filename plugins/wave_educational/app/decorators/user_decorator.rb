User.class_eval do
  # # Decorators WaveEducational
  has_one :teacher, class_name: 'WaveEducational::Teacher'
  has_one :student, class_name: 'WaveEducational::Student'

  has_many :course_memberships, class_name: 'WaveEducational::CourseMembership'
  has_many :users, through: :course_memberships

  after_create :create_student

  # Friendly ID
  extend FriendlyId
  friendly_id :name, use: [:slugged, :finders]

  def create_student
    # Create Student
    return if self.student
    student = WaveEducational::Student.create(
      name: name,
      email: email,
      user: self
    )
  end

end
