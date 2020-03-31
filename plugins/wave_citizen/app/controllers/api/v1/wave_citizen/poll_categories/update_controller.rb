module Api::V1::WaveCitizen::PollCategories
  class UpdateController < PollCategoriesController
    before_action :set_poll_category, only: %i[update]

    def update
      if @poll_category.update(poll_category_params)
        render json: @poll_category, status: 200
      else
        render json: @poll_category.errors,
               status: 422
      end
    end

  end
end
