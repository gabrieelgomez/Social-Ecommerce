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

    # Relations Core App
    belongs_to :user, optional: true

    # Validations
    validates :title, :description, presence: true

    # Callbacks
    before_save :set_user

    def set_user
      self.user = citizen&.user unless user
    end

    def type_proposal
      if user&.has_role? :superadmin
        return 'proposal_admin'
      elsif user&.citizen&.candidate?
        return 'proposal_candidate'
      elsif user&.citizen&.citizen?
        return 'proposal_citizen'
      end
      'proposal_user'
    end

  end
end
