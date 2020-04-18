module Api::V1::WaveCitizen::Polls
  class ShowController < PollsController
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

    def current_user
      @polls =  current_v1_user.polls.includes(:items, :votes, :user, :poll_category, :citizen)

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
