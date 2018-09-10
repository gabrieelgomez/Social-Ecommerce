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

  # Method used in home services categories by profiles nested
  def profiles_products_active
    self.by_profiles.collect{ |profile|
      products_count = profile.products.select{|product| product.category_ids.include?(self.id) }.count
      next if products_count.zero?
      {
        profile_id: profile.id,
        products_categories: products_count,
        profile_data: [
          type_profile: profile.type_profile,
          banner: profile.banner,
          photo: profile.photo,
          title: profile.title
        ]
      }
    }.uniq
  end

end
