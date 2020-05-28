# frozen_string_literal: true

module WaveCitizen
  # Poll class for citizens
  class Poll < ApplicationRecord
    # Relations Engine
    acts_as_commentable
    acts_as_votable
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

    def total_likes
      get_likes.size
    end

    def likes
      get_likes.as_json(only: %i[votable_type votable_id voter_type voter_id],
                        include: {
                          voter: {
                            only: %i[id email name nickname avatar]
                          }
                        })
    end

    def liked_by_current_user
      get_likes.pluck(:voter_id).flatten.uniq.include?(Current.user.id)
    end

    def total_comments
      root_comments.size
    end

    def comments
      root_comments.as_json(except: %i[title subject],
                            include: {
                              user: {
                                only: %i[id email name nickname avatar]
                              }
                            })
    end

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
      return 'poll_admin' if user&.has_role? :superadmin
      return 'poll_candidate' if user&.citizen&.candidate?
      return 'poll_citizen' if user&.citizen&.citizen?

      'poll_user'
    end
  end
end
