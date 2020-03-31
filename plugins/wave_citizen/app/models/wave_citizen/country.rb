module WaveCitizen
  class Country < ApplicationRecord
    # Relations Engine
    acts_as_paranoid
    has_many :type_candidacies, dependent: :delete_all
    has_many :proposal_categories, dependent: :delete_all

  end
end
