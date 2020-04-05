module WaveCitizen
  class Item < ApplicationRecord

    # Relations Engine
    belongs_to :poll
    # has_many :votes

    # Validations
    validates :title, presence: true

    # Callbacks
    # before_save :set_user

  end
end
