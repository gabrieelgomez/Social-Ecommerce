class Gps
  def self.categ_search(params)
    cats = params[:categories].params_to_a
    profiles = cats.collect { |n| Category.try(:find, n).profiles }
    profiles.pop
    radio = params[:radio] || 2
    # byebug
    selected_prof = profiles.select do |prof|
      Geocoder::Calculations.distance_between(params[:user], [lat(prof), long(prof)]) < radio.to_i
      # puts Geocoder::Calculations.distance_between(params[:user], [prof.locations.first.latitude, prof.locations.first.longitude])
    end
  end

  def lat(prof)
    prof.locations.first.latitude
  end

  def long(prof)
    prof.locations.first.longitude
  end
end
