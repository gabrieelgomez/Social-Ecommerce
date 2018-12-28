module Api::V1::Intranet::Boards
  class UpdateController < BoardsController
    before_action :set_intranets, only: %i[update]
    before_action :set_intranet, only: %i[update]
    before_action :set_board, only: %i[update]

    def update
      if @board.update(board_params)
        render json: @board, status: 200
      else
        render json: @board.errors,
               status: 500
      end
    end

  end
end
