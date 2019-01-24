module WaveEducational
  class Teacher < ApplicationRecord

    # Relations Engine
    has_many :courses

    # Core App
    belongs_to :user
    has_many :messages, as: :messageable
    has_many :conversations, as: :senderable
    has_many :membership_conversations, as: :memberable

    # Validations
    validates :user_id, uniqueness: {
      message: 'already has a teacher'
    }

  end
end
