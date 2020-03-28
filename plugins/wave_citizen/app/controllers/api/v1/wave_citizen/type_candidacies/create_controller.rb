module Api::V1::WaveCitizen::TypeCandidacies
  class CreateController < TypeCandidaciesController

    def create
      @type_candidacy = WaveCitizen::TypeCandidacy.new(type_candidacy_params)
      if @type_candidacy.save
        render json: @type_candidacy, status: 200
      else
        render json: @type_candidacy.errors,
               status: 422
      end
    end

  end
end
