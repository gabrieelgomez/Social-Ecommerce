class Search
  def self.deep_search(params)

    search = params[:q] || ''
    profiles = params[:profiles].try(:split, '-')
    categories = params[:categories].split('-').map &:to_i if params[:categories]
    subcategories = params[:subcategories].split('-').map &:to_i if params[:subcategories]


    # product_json = Product.select{ |product| product.mapeo_categorias(categories) } if params[:categories]

    results = Product.ransack(name_cont: search).result
                     .ransack(subcategories_id_in: subcategories).result
                     .ransack(type_profile_in: profiles).result
                     # .ransack(categories_in: categories).result

    results.as_json(only: [:id, :type_profile, :name, :price, :images], methods: :categories_name)
    #
    # # Filtering profiles
    #
    # # profiles_by_q = filter_by_q(search)
    # profiles_by_cat = filter_by_catgs(categories,
    #                                   search).to_a
    #
    # # Filtering products
    # # products_q = products_by_q(search)
    # # products_cat = product_by_subcat(categories).flatten
    # # products = (products_q + products_cat).uniq
    #
    # products_q = products_by_q(search)
    # # products_cat = product_by_subcat(categories).flatten
    # products = products_q.uniq
    #
    #
    # (profiles_by_cat + products).flatten

  end

  # Filter profiles by categories
  def self.filter_by_catgs(categories, search)
    # byebug
    Pyme.short_ransack(categories, search) +
    Independent.short_ransack(categories, search) +
    Seller.short_ransack(categories, search)
  end

  # Filter products by :q param
  def self.products_by_q(search)
    return [] if search.blank?
    Product.ransack(name_cont: search).result
  end

  # Filter products by categories/subcategories
  def self.product_by_subcat(categories)
    # byebug
    return [] if categories.empty?
    categories.collect do |cat|
      begin
        Category.try(:find, cat).subcategories.try(:map, &:products)
      rescue ActiveRecord::RecordNotFound
        []
      end
    end
  end
end
