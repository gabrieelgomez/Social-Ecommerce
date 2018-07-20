class Filter

  def self.type_profiles(products)
    profiles = products.map{|product| product.type_profile}.uniq
    @profiles = {
      pyme:        profiles.include?('pyme')        ? true : false,
      seller:      profiles.include?('seller')      ? true : false,
      independent: profiles.include?('independent') ? true : false
    }
  end

  def self.categories(products, categories, subcategories)
    categories = Category.find(products.collect{|product| product.categories_format_id}).flatten.uniq
    products_ids = products.map &:id
    @categories = []

    categories.map do |cat|
      total_cat = 0
      cat.product_ids.uniq.map{ |id| total_cat+=1 if products_ids.include?(id)}
      @categories.push(
        id: cat.id,
        name: cat.name,
        total: total_cat,
        subcategories: 0
      )
    end
    @categories = @categories.uniq
  end

  def self.categories(products, categories, subcategories)
    categories = Category.find(products.collect{|product| product.categories_format_id}).flatten.uniq
    products_ids = products.map &:id
    @categories = []

    categories.map do |cat|
      total_cat = 0
      cat.product_ids.uniq.map{ |id| total_cat+=1 if products_ids.include?(id)}
      @categories.push(
        id: cat.id,
        name: cat.name,
        total: total_cat,
        subcategories: 0
      )
    end
    @categories = @categories.uniq
  end

end
