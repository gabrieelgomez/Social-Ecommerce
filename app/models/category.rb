class Category < ApplicationRecord

  # Relations
  has_and_belongs_to_many :pymes
  has_and_belongs_to_many :profiles
  has_and_belongs_to_many :independents
  has_and_belongs_to_many :sellers

  has_many :subcategories

  def by_profiles
    pymes        = self.pymes
    sellers      = self.sellers
    independents = self.independents
    pymes.to_a.concat(sellers.to_a).concat(independents.to_a)
  end

end
