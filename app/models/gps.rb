class Gps
  def self.categ_search(params)
    cats = params[:categories].params_to_a
    profiles = cats.collect { |n| Category.try(:find, n).profiles }.first
    radio = params[:radio] || 2
    byebug
    selected_prof = profiles.select do |prof|
      Geocoder::Calculations.distance_between(params[:user], [prof.locations.first.latitude, prof.locations.first.longitude]) < radio.to_i
      # puts Geocoder::Calculations.distance_between(params[:user], [prof.locations.first.latitude, prof.locations.first.longitude])
    end
  end
end
