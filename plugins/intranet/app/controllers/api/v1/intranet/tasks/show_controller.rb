module Api::V1::Intranet::Tasks
  class ShowController < TasksController
    before_action :set_intranets, only: %i[index show]
    before_action :set_intranet, only: %i[index show]
    before_action :set_tasks, only: %i[index]
    before_action :set_task, only: %i[show]

    def index
      render json: @tasks, status: 200
    end

    def show
      render json: @task, status: 200
    end

  end
end
