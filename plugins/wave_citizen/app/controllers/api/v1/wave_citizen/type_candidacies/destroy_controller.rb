module Api::V1::WaveCitizen::TypeCandidacies
  class DestroyController < TypeCandidaciesController
    before_action :set_type_candidacy, only: %i[destroy]

    def destroy
      if @type_candidacy.destroy
        render json: @type_candidacy, status: 200
      else
        render json: @type_candidacy.errors,
               status: 500
      end
    end

  end
end
