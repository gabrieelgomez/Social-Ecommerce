module WaveCitizen
  class ProposalCategory < ApplicationRecord
    # Relations Engine
    acts_as_paranoid
    belongs_to :country
    has_many   :proposals, dependent: :delete_all

  end
end
