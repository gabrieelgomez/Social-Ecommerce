module Api::V1::WaveCitizen::Countries
  class CreateController < CountriesController

    def create
      @country = WaveCitizen::Country.new(country_params)
      if @country.save
        render json: @country, status: 200
      else
        render json: @country.errors,
               status: 422
      end
    end

  end
end
