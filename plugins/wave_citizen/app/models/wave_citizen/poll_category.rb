module WaveCitizen
  class PollCategory < ApplicationRecord
    # Relations Engine
    acts_as_paranoid
    belongs_to :country
    has_many   :polls, dependent: :delete_all

  end
end
