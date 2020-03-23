module Api::V1::WaveCitizen::Countries
  class UpdateController < CountriesController
    before_action :set_country, only: %i[update]

    def update
      if @country.update(country_params)
        render json: @country, status: 200
      else
        render json: @country.errors,
               status: 500
      end
    end

  end
end
