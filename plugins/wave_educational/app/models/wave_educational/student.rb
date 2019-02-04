module WaveEducational
  class Student < ApplicationRecord
    belongs_to :user

    # Validations
    validates :user_id, uniqueness: {
      message: 'already has a student'
    }

  end
end
