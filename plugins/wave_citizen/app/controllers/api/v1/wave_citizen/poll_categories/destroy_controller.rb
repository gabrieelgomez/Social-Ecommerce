module Api::V1::WaveCitizen::PollCategories
  class DestroyController < PollCategoriesController
    before_action :set_poll_category, only: %i[destroy]

    def destroy
      if @poll_category.destroy
        render json: @poll_category, status: 200
      else
        render json: @poll_category.errors,
               status: 422
      end
    end

  end
end
