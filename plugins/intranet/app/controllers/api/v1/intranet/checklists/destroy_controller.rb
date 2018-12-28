module Api::V1::Intranet::Checklists
  class DestroyController < ChecklistsController
    before_action :set_intranets, only: %i[destroy]
    before_action :set_intranet, only: %i[destroy]
    before_action :set_checklist, only: %i[destroy]

    def destroy
      if @checklist.destroy
        render json: @checklist, status: 200
      else
        render json: @checklist.errors,
               status: 500
      end
    end

  end
end
