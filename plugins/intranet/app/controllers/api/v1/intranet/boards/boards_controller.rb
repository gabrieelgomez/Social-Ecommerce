module Api::V1::Intranet
	class Boards::BoardsController < IntranetController
		before_action :intranets, only: %i[set_intranet]
		before_action :set_intranet, only: %i[set_boards]

		private
		# Callbacks by boards, Set boards by profile current_user
		def set_boards
			@boards = @intranet.boards
		end

		def set_board
			@board = @intranet.boards.find(params[:board_id])
		end

		# Strong params of board
    def board_params
      params.require(:board).permit(:name, :description)
    end

	end
end
