module Api::V1::WaveCitizen
  class TypeCandidacies::TypeCandidaciesController < WaveCitizenController

    private

    def set_type_candidacy
      @type_candidacy = WaveCitizen::TypeCandidacy.find_by(id: params[:type_candidacy_id])
    end

    def type_candidacy_params
      params.require(:type_candidacy).permit(:name, :country_id)
    end

  end
end
