module WaveEducational
  class CourseMembership < ApplicationRecord
    belongs_to :user
    belongs_to :course

    def student
      user
    end

  end
end
