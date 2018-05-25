class Option < ApplicationRecord
  has_and_belongs_to_many :products
  belongs_to :optionable, polymorphic: true

  serialize :values
end
