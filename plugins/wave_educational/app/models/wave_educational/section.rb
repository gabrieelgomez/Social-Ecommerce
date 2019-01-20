module WaveEducational
  class Section < ApplicationRecord
    # Relations Engine
    belongs_to :course
    has_many :classes
    has_many :exams, as: :examenable
  end
end
