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
    # profiles.pop
    radio = params[:radio] || 2
    q = params[:q].downcase || ''
    # byebug
    selected_prof = profiles.select do |prof|
      # Geocoder::Calculations.distance_between(params[:user], [latitud(prof), longitud(prof)])
      # byebug
      Geocoder::Calculations.distance_between(params[:user], [latitud(prof), longitud(prof)]) < radio.to_i && (prof.name.downcase.include?(q) || prof.title.downcase.include?(q))
      # puts Geocoder::Calculations.distance_between(params[:user], [prof.locations.first.latitude, prof.locations.first.longitude])
    end
    # byebug


  end  
end
