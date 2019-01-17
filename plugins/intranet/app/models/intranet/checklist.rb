module Intranet
  class Checklist < ApplicationRecord
    has_many :tasks
    belongs_to :card
  end
end
