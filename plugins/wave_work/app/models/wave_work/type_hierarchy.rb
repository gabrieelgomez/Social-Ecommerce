module WaveWork
  class TypeHierarchy < ApplicationRecord
    has_many :job_offers
    
    validates :title, uniqueness: true
  end
end
