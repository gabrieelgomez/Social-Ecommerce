class CustomField < ApplicationRecord
  has_and_belongs_to_many :products
  belongs_to :customizable, polymorphic: true
end
