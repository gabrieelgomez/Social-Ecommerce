# Gps class for search using gps (mobile app)
class Gps

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

  # Get profiles list
  def self.get_profiles(categories)
    return Profile.all if categories.nil?
    categories.collect { |n| Category.try(:find, n).by_profiles }.flatten.uniq
  end

  # Main function of search
  def self.categ_search(params)
    cats = params[:categories].try(:map, &:to_i)
    radio = params[:radio] || 0
    q = params[:q].downcase || ''
    get_profiles(cats).select do |prof|
      if radio.zero?
        eval_q(prof, q)
      else
        get_distance(params[:user], prof) < radio.to_i && eval_q(prof, q)
      end
    end
  end
end
