module WaveWork
  class Area < ApplicationRecord
    has_many :job_offers
    validates :title, uniqueness: true
  end
end
