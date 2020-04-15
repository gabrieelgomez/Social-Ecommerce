module Api::V1::WaveCitizen::Polls
  class ShowController < PollsController
    before_action :set_current_user_support
    before_action :set_poll, only: [:show]

    def index
      @polls =  WaveCitizen::Poll.all.includes(:items, :votes, :user, :poll_category, :citizen)

      if params[:filter] == 'expired'
        @polls =  @polls.where(["due_date <= :date",{ date: Time.now }])
      elsif params[:filter] == 'not_expired'
        @polls =  @polls.where(["due_date >= :date",{ date: Time.now }])
      end

      render json: @polls.order(id: :desc), status: 200
    end

    def show
      render json: @poll, status: 200
    end

  end
end
