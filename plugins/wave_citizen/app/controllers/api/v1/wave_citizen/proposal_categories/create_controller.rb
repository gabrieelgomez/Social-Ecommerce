module Api::V1::WaveCitizen::ProposalCategories
  class CreateController < ProposalCategoriesController

    def create
      @proposal_category = WaveCitizen::ProposalCategory.new(proposal_category_params)
      if @proposal_category.save
        render json: @proposal_category, status: 201
      else
        render json: @proposal_category.errors,
               status: 500
      end
    end

  end
end
