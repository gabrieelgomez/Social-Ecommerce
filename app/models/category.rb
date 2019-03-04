class Category < ApplicationRecord
  # mount_base64_uploader :cover, ImageUploader
  # Relations
  has_and_belongs_to_many :pymes
  has_and_belongs_to_many :profiles
  has_and_belongs_to_many :independents
  has_and_belongs_to_many :sellers
  has_and_belongs_to_many :products

  has_many :subcategories

  ransacker :name, type: :string do
    Arel.sql("unaccent(\"name\")")
  end

  ### Methods filters_by_cat, services controller
  def self.search_by_products(category, products, states, countries)
    products = category.products
                       .uniq
    products = Product.search_by_countries_states(products, states, countries) if countries || states

    products.as_json(only: %i[id type_profile name price cover stock],
                     methods: %i[category_ids subcategory_ids links url_get countries_codes states_codes],
                     include: {
                       productable: {
                         only: %i[id title type_profile slug url]
                       }
                   })
  end

  def self.search_by_profiles(category, profiles, states, countries)
    profiles = category.by_profiles
                       .uniq
    profiles = Profile.search_by_countries_states(profiles, states, countries) if countries || states

    profiles.sort_by{|profile| profile.products.count}
            .reverse
            .as_json(only: %i[id title slug photo name type_profile countries_codes states_codes], methods: %i[category_ids])
  end


  ### Methods suggest_query, services controller
  def self.suggest_query(objects, quantity=5, type_search)
    return suggest_by_products if type_search == 'products'
    suggest_by_profiles
  end

  def suggest_by_products
    self.find(categories_products).map{|category| category.products.sample(quantity)}
                                  .flatten
                                  .uniq
                                  .as_json(only: %i[id type_profile name price cover], methods: %i[category_ids subcategory_ids links url_get])
  end

  def suggest_by_profiles
    self.find(categories_profiles).map{|category| category.by_profiles.sample(quantity)}
                                  .flatten
                                  .uniq
                                  .as_json(only: %i[id title photo name type_profile prominent], methods: %i[category_ids])
  end


  ## Instacies methods
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

  def products_count
    products.count
  end

  def subcategories_with_products
    subcategories.select(&:has_product?)
                .as_json(
                  only: %i[id name],
                  methods: %i[products_charged]
                )
  end

end
