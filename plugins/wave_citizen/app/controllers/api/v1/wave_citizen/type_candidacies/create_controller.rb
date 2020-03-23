module Api::V1::WaveCitizen::TypeCandidacies
  class CreateController < TypeCandidaciesController

    def create
      @type_candidacy = WaveCitizen::TypeCandidacy.new(type_candidacy_params)
      if @type_candidacy.save
        render json: @type_candidacy, status: 201
      else
        render json: @type_candidacy.errors,
               status: 500
      end
    end

  end
end
