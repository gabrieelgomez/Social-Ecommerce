class Cotization < ApplicationRecord
  belongs_to :cotizable, polymorphic: true
  belongs_to :client
  belongs_to :deal_type
  has_and_belongs_to_many :items, -> { with_deleted }
end
