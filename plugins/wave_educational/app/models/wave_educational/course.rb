module WaveEducational
  class Course < ApplicationRecord

    # Relations Engine
    belongs_to :teacher
    has_many :sections
    has_many :exams, as: :examenable

    has_many :course_memberships
    has_many :users, through: :course_memberships

  end
end
