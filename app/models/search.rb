class Search
  def self.deep_search(params)
    search = params[:q] || ''
    categories = params[:categories].try(:map, &:to_i) || []

    # Filtering profiles 
    profiles_by_cat = filter_by_catgs(categories).flatten
    profiles_by_q = filter_by_q(search)
    profiles = (profiles_by_cat + profiles_by_q).uniq

    # Filtering products
    products_q = products_by_q(search)
    products_cat = product_by_subcat(categories)
    products = (products_q + products_cat).uniq

    (profiles + products).flatten
  end

  # Filter profiles by categories
  def self.filter_by_catgs(categories)
    categories.collect do |cat|
      Profile.ransack(categories_id_eq: cat).result
    end
  end

  # Filter profiles by :q param
  def self.filter_by_q(search)
    return [] if search.empty?
    Profile.ransack(name_or_description_or_title_cont: search)
           .result
           .to_a
  end

  # Filter products by :q param
  def self.products_by_q(search)
    return [] if search.empty?
    Product.ransack(name_cont: search).result.to_a
  end

  # Filter products by categories/subcategories
  def self.product_by_subcat(categories)
    return Product.all if categories.empty?
    categories.collect do |cat|
      Category.try(:find, cat).subcategories.try(:map, &:products)
    end
  end
end
