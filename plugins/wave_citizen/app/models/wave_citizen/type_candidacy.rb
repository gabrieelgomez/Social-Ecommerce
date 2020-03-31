module WaveCitizen
  class TypeCandidacy < ApplicationRecord
    # Relations Engine
    acts_as_paranoid
    belongs_to :country
    has_many   :citizens, dependent: :delete_all

  end
end
