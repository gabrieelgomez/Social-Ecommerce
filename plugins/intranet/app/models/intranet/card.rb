module Intranet
  class Card < ApplicationRecord
    has_and_belongs_to_many :users
    has_many :checklists
    belongs_to :intranet
    belongs_to :board
    belongs_to :list
  end
end
