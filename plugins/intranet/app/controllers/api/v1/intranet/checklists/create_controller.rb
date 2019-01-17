module Api::V1::Intranet::Checklists
  class CreateController < ChecklistsController
    before_action :set_intranet, only: %i[create]

    def create
      @checklist = Intranet::Checklist.new(checklist_params)
      @checklist.intranet = @intranet
      if @checklist.save
        render json: @checklist, status: 200
      else
        render json: @checklist.errors, status: 500
      end
    end

  end
end
