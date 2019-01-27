module WaveWork
  class TypeQuestion < ApplicationRecord
    belongs_to :exam

    validates_inclusion_of :question_type, :in => %w(open boolean alternative)
  end
end
