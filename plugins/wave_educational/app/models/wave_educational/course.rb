module WaveEducational
  class Course < ApplicationRecord

    # Relations Engine
    belongs_to :teacher
    has_many :sections
    has_many :exams, as: :examenable

  end
end
