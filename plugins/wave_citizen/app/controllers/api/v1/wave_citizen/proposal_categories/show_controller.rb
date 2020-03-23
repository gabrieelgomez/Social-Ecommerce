module Api::V1::WaveCitizen::ProposalCategories
  class ShowController < ProposalCategoriesController
    before_action :set_proposal_category, only: [:show]

    def index
      render json: WaveCitizen::ProposalCategory.all.order(id: :asc), status: 200
    end

    def show
      render json: @proposal_category, status: 200
    end

  end
end
