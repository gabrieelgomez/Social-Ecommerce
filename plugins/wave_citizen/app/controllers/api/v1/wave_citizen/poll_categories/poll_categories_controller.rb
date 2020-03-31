module Api::V1::WaveCitizen
  class PollCategories::PollCategoriesController < WaveCitizenController

    private

    def set_poll_category
      @poll_category = WaveCitizen::PollCategory.find_by(id: params[:poll_category_id])
    end

    def poll_category_params
      params.require(:poll_category).permit(:name, :country_id)
    end

  end
end
