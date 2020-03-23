module Api::V1::WaveCitizen::Citizens
  class ShowController < CitizensController
    before_action :set_citizen, only: [:show]

    def index
      render json: WaveCitizen::Citizen.all.order(id: :asc), status: 200
    end

    def show
      render json: @citizen, status: 200
    end

  end
end
