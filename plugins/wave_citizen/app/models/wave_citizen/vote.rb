# frozen_string_literal: true

module WaveCitizen
  # Vote class for poll
  class Vote < ApplicationRecord
    # Relations Engine
    belongs_to :votable, polymorphic: true
    belongs_to :poll, optional: true

    # Relations Core App
    belongs_to :user
    belongs_to :citizen, optional: true

    # Validations
    validates  :votable_type, :votable_id, presence: true
    validates :user_id, uniqueness: { message: "Can't vote same votable twice",
                                      scope: %i[votable_id votable_type] }
    validates :user_id, uniqueness: { message: "Can't vote same poll twice",
                                      scope: [:poll_id] }

    def citizen
      user.citizen
    end
  end
end
