module Api::V1::Intranet::Boards
  class DestroyController < BoardsController
    before_action :set_intranets, only: %i[destroy]
    before_action :set_intranet, only: %i[destroy]
    before_action :set_board, only: %i[destroy]

    def destroy
      if @board.destroy
        render json: @board, status: 200
      else
        render json: @board.errors,
               status: 422
      end
    end

  end
end
