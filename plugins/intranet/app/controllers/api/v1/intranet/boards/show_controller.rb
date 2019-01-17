module Api::V1::Intranet::Boards
  class ShowController < BoardsController
    before_action :set_intranets, only: %i[index show]
    before_action :set_intranet, only: %i[index show]
    before_action :set_boards, only: %i[index]
    before_action :set_board, only: %i[show]

    def index
      render json: @boards, status: 200
    end

    def show
      render json: @board, status: 200
    end

  end
end
