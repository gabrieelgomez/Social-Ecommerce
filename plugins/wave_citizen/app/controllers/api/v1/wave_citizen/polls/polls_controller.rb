module Api::V1::WaveCitizen
  class Polls::PollsController < WaveCitizenController
    before_action :set_current_user_support

    private

    def set_poll
      @poll = WaveCitizen::Poll.find_by(id: params[:poll_id])
    end

    def poll_params
      params.require(:poll).permit(:title, :description, :user_id, :citizen_id, :poll_category_id, :due_date, :available, items_attributes: [:id, :title, :_destroy])
    end

  end
end
