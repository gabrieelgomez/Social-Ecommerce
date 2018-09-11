# frozen_string_literal: true

# Contact Type Model
class ContactType < ApplicationRecord
  validates :name, presence: true
end
