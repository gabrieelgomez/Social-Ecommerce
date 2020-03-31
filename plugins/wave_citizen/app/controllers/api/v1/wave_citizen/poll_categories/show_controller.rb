module Api::V1::WaveCitizen::PollCategories
  class ShowController < PollCategoriesController
    before_action :set_poll_category, only: [:show]

    def index
      render json: WaveCitizen::PollCategory.all.order(id: :asc), status: 200
    end

    def show
      render json: @poll_category, status: 200
    end

  end
end
