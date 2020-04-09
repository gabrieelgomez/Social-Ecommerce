module WaveCitizen
  class Poll < ApplicationRecord

    # Relations Engine
    # gem 'acts_as_votable'
    # acts_as_votable
    # acts_as_commentable
    # acts_as_paranoid
    # acts_as_ordered_taggable
    # acts_as_ordered_taggable_on :skills, :interests
    has_many   :items
    belongs_to :poll_category
    belongs_to :citizen, optional: true

    # Relations Core App
    belongs_to :user, optional: true

    # Validations
    validates :title, :description, :due_date, presence: true

    # Callbacks
    before_save :set_user

    accepts_nested_attributes_for :items, allow_destroy: true


    def set_user
      self.user = citizen&.user unless user
    end

    def type_poll
      if user&.has_role? :superadmin
        return 'poll_admin'
      elsif user&.citizen&.candidate?
        return 'poll_candidate'
      elsif user&.citizen&.citizen?
        return 'poll_citizen'
      end
      'poll_user'
    end

  end
end
