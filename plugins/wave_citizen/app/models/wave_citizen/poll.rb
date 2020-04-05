module WaveCitizen
  class Poll < ApplicationRecord

    # Relations Engine
    # gem 'acts_as_votable'
    # acts_as_votable
    # acts_as_commentable
    # acts_as_paranoid
    # acts_as_ordered_taggable
    # acts_as_ordered_taggable_on :skills, :interests
    belongs_to :poll_category
    belongs_to :citizen, optional: true

    # Relations Core App
    belongs_to :user, optional: true

    # Validations
    validates :title, :description, :due_date, presence: true

    # Callbacks
    before_save :set_user

    def set_user
      self.user = citizen&.user unless user
    end

  end
end
