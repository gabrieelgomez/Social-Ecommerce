module WaveEducational
  class Class < ApplicationRecord
    # Relations Engine
    belongs_to :section
    has_many :exams, as: :examenable
  end
end
