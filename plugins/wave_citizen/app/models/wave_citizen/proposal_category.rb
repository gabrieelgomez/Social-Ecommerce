module WaveCitizen
  class ProposalCategory < ApplicationRecord
    # Relations Engine
    belongs_to :country
    # has_many   :proposals

  end
end
