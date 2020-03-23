module Api::V1::WaveCitizen
  class Countries::CountriesController < WaveCitizenController

    private

    def set_country
      @country = WaveCitizen::Country.find_by(id: params[:country_id])
    end

    def country_params
      params.require(:country).permit(:name, :country_code, :currency)
    end

  end
end
