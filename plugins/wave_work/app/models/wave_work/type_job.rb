module WaveWork
  class TypeJob < ApplicationRecord
    has_many :job_offers
    
    validates :title, uniqueness: true
  end
end
