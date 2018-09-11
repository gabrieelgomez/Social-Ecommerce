class Category < ApplicationRecord

  # Relations
  has_and_belongs_to_many :pymes
  has_and_belongs_to_many :profiles
  has_and_belongs_to_many :independents
  has_and_belongs_to_many :sellers
  has_and_belongs_to_many :products


  has_many :subcategories

  def by_profiles
    pymes        = self.pymes
    sellers      = self.sellers
    independents = self.independents
    ids = pymes.to_a.concat(sellers.to_a).concat(independents.to_a).map(&:id)
    Profile.where(id:ids)
  end

  def by_sorting_profiles_products
    self.by_profiles.sort_by{|profile| profile.products_categories(self.id)}
  end

end
