module WaveEducational
  class Course < ApplicationRecord

    # Relations Engine
    belongs_to :teacher
    
  end
end
