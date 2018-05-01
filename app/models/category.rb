class Category < ApplicationRecord

  # Relations
  has_and_belongs_to_many :profiles
  has_many :subcategories

end
