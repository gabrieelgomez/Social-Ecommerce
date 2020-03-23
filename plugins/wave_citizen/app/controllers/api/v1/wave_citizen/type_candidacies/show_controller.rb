module Api::V1::WaveCitizen::TypeCandidacies
  class ShowController < TypeCandidaciesController
    before_action :set_type_candidacy, only: [:show]

    def index
      render json: WaveCitizen::TypeCandidacy.all.order(id: :asc), status: 200
    end

    def show
      render json: @type_candidacy, status: 200
    end

  end
end
