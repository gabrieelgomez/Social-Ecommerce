User.class_eval do
  # Decorators WaveWork
  has_one :worker, class_name: 'WaveWork::Worker'

  after_create :create_worker

  # Friendly ID
  extend FriendlyId
  friendly_id :name, use: [:slugged, :finders]

  def create_worker
    # Create Student
    return if self.worker
    worker = WaveWork::Student.create(
      name: name,
      email: email,
      user: self
    )
  end

end
