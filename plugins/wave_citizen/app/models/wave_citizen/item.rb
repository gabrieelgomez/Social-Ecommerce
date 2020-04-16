module WaveCitizen
  class Item < ApplicationRecord

    # Relations Engine
    belongs_to :poll
    has_many   :votes, as: :votable

    # Validations
    validates :title, presence: true

    def total_item_votes
      votes.size
    end

    def voted_by_current_user
      votes.pluck(:user_id).flatten.uniq.include?(Current.user.id)
    end

  end
end
