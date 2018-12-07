module Intranet
  class Membership < ApplicationRecord
    belongs_to :user
    belongs_to :group
    belongs_to :intranet
    belongs_to :profile
  end
end
