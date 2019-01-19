module WaveEducational
  class Course < ApplicationRecord

    # Relations Engine
    belongs_to :teacher
    has_many :sections

  end
end
