module WaveCitizen
  class Country < ApplicationRecord
    # Relations Engine
    has_many :type_candidacies
    has_many :proposal_categories

  end
end
