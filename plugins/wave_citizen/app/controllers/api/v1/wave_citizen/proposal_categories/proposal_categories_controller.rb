module Api::V1::WaveCitizen
  class ProposalCategories::ProposalCategoriesController < WaveCitizenController

    private

    def set_proposal_category
      @proposal_category = WaveCitizen::ProposalCategory.find_by(id: params[:proposal_category_id])
    end

    def proposal_category_params
      params.require(:proposal_category).permit(:name, :country_id)
    end

  end
end
