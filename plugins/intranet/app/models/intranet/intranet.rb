module Intranet
  class Intranet < ApplicationRecord

    has_many :posts, as: :postable
    has_many :groups
    has_many :memberships
    has_many :users, through: :groups

    # Relationships trello
    has_many :boards
    has_many :cards
    has_one  :inventory_control

    belongs_to :profile

    # Validations
    validates :profile_id, uniqueness: {
      message: 'already has a intranet'
    }

  end
end
