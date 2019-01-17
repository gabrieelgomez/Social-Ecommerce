module Api::V1::Intranet
	class Groups::GroupsController < IntranetController
		before_action :intranets, only: %i[set_intranet]
		before_action :set_intranet, only: %i[set_groups]

		private
		# Callbacks by groups, Set groups by profile current_user
		def set_groups
			@groups = @intranet.groups
		end

		def set_group
			@group = @intranet.groups.find(params[:group_id])
		end

		# Strong params of group
    def group_params
      params.require(:group).permit(:title, :subtitle, :description, :banner, :cover)
    end

	end
end
