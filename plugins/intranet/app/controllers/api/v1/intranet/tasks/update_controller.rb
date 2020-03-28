module Api::V1::Intranet::Tasks
  class UpdateController < TasksController
    before_action :set_intranets, only: %i[update]
    before_action :set_intranet, only: %i[update]
    before_action :set_task, only: %i[update]

    def update
      if @task.update(task_params)
        render json: @task, status: 200
      else
        render json: @task.errors,
               status: 422
      end
    end

  end
end
