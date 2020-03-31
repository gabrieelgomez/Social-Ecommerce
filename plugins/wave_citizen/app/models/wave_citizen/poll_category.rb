module WaveCitizen
  class PollCategory < ApplicationRecord
    # Relations Engine
    acts_as_paranoid
    belongs_to :country
    # has_many   :polls, dependent: :delete_all

    # acts_as_commentable
    # acts_as_paranoid
    # acts_as_taggable_on :tags

  end
end
