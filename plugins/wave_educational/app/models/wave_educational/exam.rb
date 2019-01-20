module WaveEducational
  class Exam < ApplicationRecord

    belongs_to :examenable, polymorphic: true
    has_many :type_questions

  end
end
