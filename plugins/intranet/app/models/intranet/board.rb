module Intranet
  class Board < ApplicationRecord
    belongs_to :intranet
    has_many :lists
    has_many :cards
  end
end
