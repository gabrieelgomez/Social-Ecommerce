module Api::V1::WaveCitizen::PollCategories
  class CreateController < PollCategoriesController

    def create
      @poll_category = WaveCitizen::PollCategory.new(poll_category_params)
      if @poll_category.save
        render json: @poll_category, status: 200
      else
        render json: @poll_category.errors,
               status: 422
      end
    end

  end
end
