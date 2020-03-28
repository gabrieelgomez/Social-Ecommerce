module Api::V1::WaveCitizen::ProposalCategories
  class UpdateController < ProposalCategoriesController
    before_action :set_proposal_category, only: %i[update]

    def update
      if @proposal_category.update(proposal_category_params)
        render json: @proposal_category, status: 200
      else
        render json: @proposal_category.errors,
               status: 422
      end
    end

  end
end
