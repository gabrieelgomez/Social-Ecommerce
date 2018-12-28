module Intranet
  class Task < ApplicationRecord
    belongs_to :checklist
  end
end
