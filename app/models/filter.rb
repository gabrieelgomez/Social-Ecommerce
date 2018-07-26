class Filter

  # Filters by profiles
  def self.type_profiles(objects)
    profiles = objects.map{|object| object.type_profile}.uniq.map &:downcase
    @profiles = {
      pyme:        profiles.include?('pyme')        ? true : false,
      seller:      profiles.include?('seller')      ? true : false,
      independent: profiles.include?('independent') ? true : false
    }
  end
  # End Filters by profiles

  # Filters by categories
  def self.categories(objects)
    categories = Category.find(objects.collect{|object| object.category_ids}).flatten.uniq
    objects_ids = objects.map &:id
    @categories = []

    # byebug
    categories.each do |category|
      total_category = 0

      if objects.first.is_a?(Profile)
        total_category = set_cat_profiles_ids(category, objects_ids)

      elsif objects.first.is_a?(Product)
        total_category = set_cat_products_ids(category, objects_ids)
      end

      @categories.push(
        id: category.id,
        name: category.name,
        total: total_category,
        subcategories_by_objects: set_subcat(category, objects_ids, objects.first)
      )
    end
    @categories = @categories.uniq
  end
  # ----- Categories

  # Filters by subcategories
  def self.set_subcat(category, objects_ids, type_class)
    return nil if type_class.is_a?(Profile)
    @subcategories = []
    category.subcategories.each do |subcategory|
      total_subcat = 0
      subcategory.product_ids.uniq.map{ |id| total_subcat+=1 if objects_ids.include?(id)}

      unless total_subcat.zero?
        @subcategories.push(
          id: subcategory.id,
          name: subcategory.name,
          total: total_subcat
        )
      end

    end

    @subcategories
  end
  # ----- Subcategories

  # Callbacks by categories and subcategories
  def self.set_cat_profiles_ids(category, objects_ids)
    total_category = 0
    array_cat = category.pyme_ids, category.seller_ids, category.independent_ids
    array_cat.flatten.uniq.map{ |id| total_category+=1 if objects_ids.include?(id)}
    total_category
  end

  def self.set_cat_products_ids(category, objects_ids)
    total_category = 0
    category.product_ids.uniq.map{ |id| total_category+=1 if objects_ids.include?(id)}
    total_category
  end
  # End Callbacks by categories and subcategories


  # Filter by Countries
  def self.countries(objects)
    @countries = []
    countries = objects.collect{|object| object.countries_codes}.flatten.uniq
    cities    = objects.collect{|object| object.states_codes}.flatten.uniq

    countries.each do |country|
      total_country = 0
      objects.map{ |object| total_country+=1 if object.countries_codes.include?(country)}
      unless total_country.zero?
        @countries.push(
          country_name: CS.get[country.to_sym],
          country_code: country,
          total: total_country
        )
      end
    end

    cities_json = set_cities(cities, objects)

    @countries + cities_json
  end

  def self.set_cities(cities_array, objects)
    @cities = []
    cities_array.each do |city|
      total_cities = 0
      objects.map{ |object| total_cities+=1 if object.states_codes.include?(city)}
      unless total_cities.zero?
        @cities.push(
          city_name: city.capitalize,
          city_code: city,
          total: total_cities
        )
      end
    end
    @cities
  end

  # End Filters by Countries


end
