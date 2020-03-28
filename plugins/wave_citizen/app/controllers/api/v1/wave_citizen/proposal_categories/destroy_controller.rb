module Api::V1::WaveCitizen::ProposalCategories
  class DestroyController < ProposalCategoriesController
    before_action :set_proposal_category, only: %i[destroy]

    def destroy
      if @proposal_category.destroy
        render json: @proposal_category, status: 200
      else
        render json: @proposal_category.errors,
               status: 422
      end
    end

  end
end
