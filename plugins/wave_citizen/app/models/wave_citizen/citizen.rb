module WaveCitizen
  class Citizen < ApplicationRecord

    # Relations Engine
    acts_as_paranoid
    has_many :proposals, dependent: :delete_all
    has_many :polls, dependent: :delete_all
    belongs_to :type_candidacy, optional: true
    enum status_citizen: {citizen: 0, candidate: 1}

    # Core App
    belongs_to :user, dependent: :destroy

    # Validations
    validates :email, :nickname, uniqueness: true
    validates :user_id, uniqueness: {
      message: 'already has a citizen'
    }

    validates :user_id, presence: {
      message: 'User has already been taken by email or nickname'
    }

  end
end
