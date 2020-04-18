User.class_eval do
  # # Decorators WaveCitizen
  has_one :citizen, class_name: 'WaveCitizen::Citizen', dependent: :destroy
  has_many :proposals, class_name: 'WaveCitizen::Proposal', dependent: :destroy
  has_many :polls, class_name: 'WaveCitizen::Poll', dependent: :destroy

  # has_one :student, class_name: 'WaveCitizen::Student'

  # has_many :citizen_groups, class_name: 'WaveCitizen::Groups'
  # has_many :users, through: :citizen_groups

  # after_create :create_student

  # Friendly ID
  extend FriendlyId
  friendly_id :name, use: [:slugged, :finders]

  # def create_student
  #   # Create Student
  #   return if self.student
  #   student = WaveCitizen::Student.create(
  #     name: name,
  #     email: email,
  #     user: self
  #   )
  # end

end
