module WaveEducational
  class TypeQuestion < ApplicationRecord
    belongs_to :exam

    # self.inheritance_column = :type
  end
end
