class Filter

  def self.type_profiles(objects)
    profiles = objects.map{|object| object.type_profile}.uniq.map &:downcase
    @profiles = {
      pyme:        profiles.include?('pyme')        ? true : false,
      seller:      profiles.include?('seller')      ? true : false,
      independent: profiles.include?('independent') ? true : false
    }
  end

  def self.categories(objects)
    categories = Category.find(objects.collect{|object| object.category_ids}).flatten.uniq
    objects_ids = objects.map &:id
    @categories = []

    categories.each do |cat|
      total_cat = 0
      total_cat = objects.first.is_a?(Profile) ? set_cat_profiles_ids(cat, objects_ids) : set_cat_products_ids(cat, objects_ids)

      @categories.push(
        id: cat.id,
        name: cat.name,
        total: total_cat,
        subcategories_by_objects: set_subcat(cat, objects_ids)
      )
    end
    @categories = @categories.uniq
  end

  def self.set_subcat(category, objects_ids)
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


  def self.set_cat_profiles_ids(category, objects_ids)
    total_cat = 0
    category.profile_ids.uniq.map{ |id| total_cat+=1 if objects_ids.include?(id)}
    total_cat
  end


  def self.set_cat_products_ids(category, objects_ids)
    total_cat = 0
    category.product_ids.uniq.map{ |id| total_cat+=1 if objects_ids.include?(id)}
    total_cat
  end

end
