module WaveEducational
  class TypeQuestion < ApplicationRecord
    belongs_to :exam

    validates_inclusion_of :stage, :in => %w(open boolean alternative)
  end
end
