module WaveWork
  class Requirement < ApplicationRecord
    belongs_to :job_offer
  end
end
