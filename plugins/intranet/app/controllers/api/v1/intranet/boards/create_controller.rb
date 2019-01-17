module Api::V1::Intranet::Boards
  class CreateController < BoardsController
    before_action :set_intranet, only: %i[create]

    def create
      @board = Intranet::Board.new(board_params)
      @board.intranet = @intranet
      if @board.save
        render json: @board, status: 200
      else
        render json: @board.errors, status: 500
      end
    end

  end
end
