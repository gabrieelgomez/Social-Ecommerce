module Api::V1::WaveCitizen::Countries
  class DestroyController < CountriesController
    before_action :set_country, only: %i[destroy]

    def destroy
      if @country.destroy
        render json: @country, status: 200
      else
        render json: @country.errors,
               status: 422
      end
    end

  end
end
