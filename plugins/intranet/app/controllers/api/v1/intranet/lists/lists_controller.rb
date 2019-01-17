module Api::V1::Intranet
	class Lists::ListsController < IntranetController
		before_action :intranets, only: %i[set_intranet]
		before_action :set_intranet, only: %i[set_lists]

		private
		# Callbacks by lists, Set lists by profile current_user
		def set_lists
			@lists = @intranet.lists
		end

		def set_list
			@list = @intranet.lists.find(params[:list_id])
		end

		# Strong params of list
    def list_params
      params.require(:list).permit(:name, :description)
    end

	end
end
