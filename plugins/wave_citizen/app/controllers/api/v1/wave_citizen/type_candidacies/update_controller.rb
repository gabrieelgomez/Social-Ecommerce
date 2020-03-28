module Api::V1::WaveCitizen::TypeCandidacies
  class UpdateController < TypeCandidaciesController
    before_action :set_type_candidacy, only: %i[update]

    def update
      if @type_candidacy.update(type_candidacy_params)
        render json: @type_candidacy, status: 200
      else
        render json: @type_candidacy.errors,
               status: 422
      end
    end

  end
end
