class Category < ApplicationRecord

  # Pymes
  has_and_belongs_to_many :pymes, -> { where(type_profile: 'pyme') },
           class_name: 'Pyme'
  # Independents
  has_and_belongs_to_many :independents, -> { where(type_profile: 'independent') },
           class_name: 'Independent'
  # Seller
  has_and_belongs_to_many  :seller, -> { where(type_profile: 'seller') },
           class_name: 'Seller'

  has_many :subcategory

end
