module Api::V1::Intranet::Tasks
  class DestroyController < TasksController
    before_action :set_intranets, only: %i[destroy]
    before_action :set_intranet, only: %i[destroy]
    before_action :set_task, only: %i[destroy]

    def destroy
      if @task.destroy
        render json: @task, status: 200
      else
        render json: @task.errors,
               status: 500
      end
    end

  end
end
