class Gps
  def self.latitud(prof)
    prof.locations.first.latitude
  end

  def self.longitud(prof)
    prof.locations.first.longitude
  end

  def self.categ_search(params)
    cats = params[:categories].params_to_a
    profiles = cats.collect { |n| Category.try(:find, n).profiles }.first
    radio = params[:radio] || 2
    q = params[:q].downcase || ''
    selected_prof = profiles.select do |prof|
      Geocoder::Calculations.distance_between(params[:user], [latitud(prof), longitud(prof)]) < radio.to_i && (prof.name.downcase.include?(q) || prof.title.downcase.include?(q))
    end
  end  
end
