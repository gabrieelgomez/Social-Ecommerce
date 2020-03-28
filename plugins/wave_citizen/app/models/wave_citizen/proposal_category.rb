module WaveCitizen
  class ProposalCategory < ApplicationRecord
    # Relations Engine
    belongs_to :country
    # has_many   :proposals, dependent: :delete_all

  end
end
