module Api::V1::WaveCitizen::Countries
  class ShowController < CountriesController
    before_action :set_country, only: [:show]

    def index
      render json: WaveCitizen::Country.all.order(id: :asc), status: 200
    end

    def show
      render json: @country, status: 200
    end

  end
end
