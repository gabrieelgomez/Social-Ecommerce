class Gps
  def self.latitud(prof)
    prof.locations.first.try(:latitude)
  end

  def self.longitud(prof)
    prof.locations.first.try(:longitude)
  end

  def self.get_distance(user, prof)
    Geocoder::Calculations.distance_between(user,
                                            [latitud(prof), longitud(prof)])
  end

  def self.eval_q(prof, q)
    prof.name.downcase.include?(q) || prof.title.downcase.include?(q)
  end

  def self.get_profiles(categories)
    return Profile.all if categories.nil?
    categories.collect { |n| Category.try(:find, n).profiles }.first
  end

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
