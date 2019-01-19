module WaveEducational
  class Section < ApplicationRecord
    # Relations Engine
    belongs_to :course
    has_many :classes
  end
end
