Profile.class_eval do
  # Decorators WaveWork
  has_many :job_offers, class_name: 'WaveWork::JobOffer'
end
