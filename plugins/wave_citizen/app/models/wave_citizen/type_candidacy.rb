module WaveCitizen
  class TypeCandidacy < ApplicationRecord
    # Relations Engine
    belongs_to :country
    has_many   :citizens, dependent: :delete_all

  end
end
