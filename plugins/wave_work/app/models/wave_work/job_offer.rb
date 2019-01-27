module WaveWork
  class JobOffer < ApplicationRecord
    belongs_to :profile
    belongs_to :area
    belongs_to :type_hierarchy
    belongs_to :type_job
  end
end
