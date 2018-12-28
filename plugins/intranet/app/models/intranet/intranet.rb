module Intranet
  class Intranet < ApplicationRecord

    has_many :posts, as: :postable
    has_many :groups
    has_many :memberships
    has_many :users, through: :groups

    # Relationships trello
    has_many :boards
    has_many :cards

    belongs_to :profile
  end
end
