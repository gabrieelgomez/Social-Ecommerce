module Api::V1::Intranet::Tasks
  class CreateController < TasksController
    before_action :set_intranet, only: %i[create]

    def create
      @task = Intranet::Board.new(task_params)
      @task.intranet = @intranet
      if @task.save
        render json: @task, status: 200
      else
        render json: @task.errors, status: 500
      end
    end

  end
end
