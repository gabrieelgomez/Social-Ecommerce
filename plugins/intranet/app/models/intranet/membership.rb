module Intranet
  class Membership < ApplicationRecord
    # Record for the registration of members in groups of an intranet
    belongs_to :user
    belongs_to :group
    belongs_to :intranet
    belongs_to :profile

    validates :user, uniqueness: true
  end
end
