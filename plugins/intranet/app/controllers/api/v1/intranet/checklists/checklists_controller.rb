module Api::V1::Intranet
	class Checklists::ChecklistsController < IntranetController
		before_action :intranets, only: %i[set_intranet]
		before_action :set_intranet, only: %i[set_checklists]

		private
		# Callbacks by checklists, Set checklists by profile current_user
		def set_checklists
			@checklists = @intranet.checklists
		end

		def set_checklist
			@checklist = @intranet.checklists.find(params[:checklist_id])
		end

		# Strong params of checklist
    def checklist_params
      params.require(:checklist).permit(:name, :description)
    end

	end
end
