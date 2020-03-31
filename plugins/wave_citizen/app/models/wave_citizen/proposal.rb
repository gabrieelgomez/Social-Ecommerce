module WaveCitizen
  class Proposal < ApplicationRecord

    # Relations Engine
    # gem 'acts_as_votable'
    # acts_as_votable
    # acts_as_commentable
    # acts_as_paranoid
    # acts_as_ordered_taggable
    # acts_as_ordered_taggable_on :skills, :interests
    belongs_to :proposal_category
    belongs_to :citizen, optional: true
    belongs_to :user, optional: true

    before_save :set_user

    def set_user
      self.user = citizen&.user unless user
    end

  end
end
