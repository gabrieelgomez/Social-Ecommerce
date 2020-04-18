module WaveCitizen
  class Poll < ApplicationRecord

    # Relations Engine
    # gem 'acts_as_votable'
    # acts_as_votable
    # acts_as_commentable
    # acts_as_ordered_taggable
    # acts_as_ordered_taggable_on :skills, :interests
    acts_as_paranoid
    has_many   :items, dependent: :destroy
    has_many   :votes, through: :items
    belongs_to :poll_category
    belongs_to :citizen, optional: true

    # Relations Core App
    belongs_to :user

    # Validations
    validates :title, :description, :due_date, presence: true

    # Callbacks
    before_save :set_citizen

    accepts_nested_attributes_for :items, allow_destroy: true


    def set_citizen
      self.citizen = user.citizen
    end

    def total_poll_votes
      votes.size
    end

    def voted_by_current_user
      votes.pluck(:user_id).flatten.uniq.include?(Current.user.id)
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
