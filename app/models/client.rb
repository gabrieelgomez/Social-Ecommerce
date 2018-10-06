class Client < ApplicationRecord
  belongs_to :clientable, polymorphic: true, optional: true
  belongs_to :ownerable, polymorphic: true
end
