# Gps class for search using gps (mobile app)
class GpsService

  # Main function of search
  def self.categ_search(params)
    cats = params[:categories].try(:map, &:to_i)
    radio = params[:radio] || 0
    q = params[:q].downcase || ''
    profiles = get_profiles(cats).select do |prof|
      if radio.zero?
        eval_q(prof, q)
      else
        get_distance(params[:user], prof) < radio.to_i && eval_q(prof, q)
      end
    end

    profiles_products, product_ids = get_products(q)
    profiles_products.select do |product|
      if radio.zero?
        true
      else
        get_distance(params[:user], product) < radio.to_i
      end
    end
    return profiles.uniq, profiles_products.uniq, product_ids.uniq
    # (profiles + products)
  end

  # Get profiles list
  def self.get_profiles(categories)
    return Profile.all if categories.nil?
    categories.collect { |n| Category.try(:find, n).by_profiles }.flatten.uniq
  end

  def self.get_products(query)
    profiles_products    = []
    product_ids = []
    Product.ransack(name_cont: query).result.map do |product|
      profiles_products << product.productable
      product_ids       << product.id
    end
    return profiles_products, product_ids
  end

  # Get lat
  def self.latitud(prof)
    prof.locations.first.try(:latitude)
  end

  # Get long
  def self.longitud(prof)
    prof.locations.first.try(:longitude)
  end

  # Get distance between two points
  def self.get_distance(user, prof)
    Geocoder::Calculations.distance_between(user,
                                            [latitud(prof), longitud(prof)])
  end

  # Evaluate coincidence with params and profile names
  def self.eval_q(prof, q)
    prof.name.downcase.include?(q) || prof.title.downcase.include?(q)
  end


  # Obtener el response de Locations anidado con profiles, custom response
  def self.locations_response(profiles, var_bool, product_ids)
    #Se inicializan un json de todos los Locations
    all_locations =  Location.all.collect{ |local| {latitude: local.latitude, longitude: local.longitude, profiles: []} }.uniq

    #Se iteran todos los profiles que ya vienen parseados por GPS
     profiles.each do |profile|
       #Se obtienen los locations de cada profile
      profile.locations.each do |location_profile|
        #Se recorren todos los profiles y locations en conjunto para hallar coincidencia
        all_locations.each_with_index do |lol,z|
          if location_profile.latitude.eql?(lol[:latitude]) && location_profile.longitude.eql?(lol[:longitude])
            #Si existe coincidencia, se hace push del profile en la ubicacion del objeto/json de all_locations
            all_locations[z][:profiles].push(
              [
                id: profile.id,
                type_profile: profile.type_profile,
                banner: profile.banner,
                photo: profile.photo,
                title: profile.title,
                products: profile.products_locations(var_bool, product_ids)
              ]
            ).uniq
          end

        end
      end
    end
    clean_profiles(all_locations)
  end

  # Limpiar profiles vacios que no encontraron un profile con sus coordenadas.
  def self.clean_profiles(all_locations)
    all_locations.reject{|loc| loc[:profiles].empty?}
  end

end
