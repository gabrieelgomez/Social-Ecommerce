class Category < ApplicationRecord

  # Relations
  has_and_belongs_to_many :pymes, -> { where(type_profile: 'pyme') },
           class_name: 'Pyme'

  # Independents
  has_and_belongs_to_many :independents, -> { where(type_profile: 'independent') },
           class_name: 'Independent'

  # Sellers
  has_and_belongs_to_many :sellers, -> { where(type_profile: 'seller') },
          class_name: 'Seller'

  has_many :subcategories

  def by_profiles
    pymes        = self.pymes
    sellers      = self.sellers
    independents = self.independents
    pymes.to_a.concat(sellers.to_a).concat(independents.to_a)
  end

end
