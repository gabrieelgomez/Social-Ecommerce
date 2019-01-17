module Api::V1::Intranet
	class Tasks::TasksController < IntranetController
		before_action :intranets, only: %i[set_intranet]
		before_action :set_intranet, only: %i[set_tasks]

		private
		# Callbacks by tasks, Set tasks by profile current_user
		def set_tasks
			@tasks = @intranet.tasks
		end

		def set_task
			@task = @intranet.tasks.find(params[:task_id])
		end

		# Strong params of task
    def task_params
      params.require(:task).permit(:name, :description)
    end

	end
end
