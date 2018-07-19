class LookFor
  def self.search(params)

    search        = params[:q] || nil
    profiles      = params[:profiles].try(:split, '-').try(:map, &:capitalize)
    categories    = params[:categories].try(:split, '-').try(:map, &:to_i)
    subcategories = params[:subcategories].try(:split, '-').try(:map, &:to_i)
    states        = params[:states_codes].try(:split, '-').try(:map, &:to_s)
    countries     = params[:countries_codes].try(:split, '-').try(:map, &:to_s)

    # product_json = Product.select{ |product| product.mapeo_categorias(categories) } if params[:categories]

    products = Product.ransack(name_cont: search).result
                      .ransack(subcategories_id_in: subcategories).result
                      .ransack(type_profile_in: profiles).result
                      .ransack(categories_id_in: categories).result
                      # .ransack(states_codes_in: states).result
                      # .ransack(countries_codes_in: countries).result

    products = products.uniq.as_json(only: [:id, :type_profile, :name, :price, :images, :states_codes, :countries_codes], methods: :categories_name)

    profiles = Profile.ransack(title_cont: search).result
                      .ransack(type_profile_in: profiles).result
                      # .ransack(categories_id_in: categories).result
                      # .ransack(states_codes_in: states).result
                      # .ransack(countries_codes_in: countries).result

    profiles = profiles.uniq.as_json(only: [:id, :title, :photo, :type_profile])

    return products, profiles, nil
  end
end
