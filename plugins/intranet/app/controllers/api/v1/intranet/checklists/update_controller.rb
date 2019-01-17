module Api::V1::Intranet::Checklists
  class UpdateController < ChecklistsController
    before_action :set_intranets, only: %i[update]
    before_action :set_intranet, only: %i[update]
    before_action :set_checklist, only: %i[update]

    def update
      if @checklist.update(checklist_params)
        render json: @checklist, status: 200
      else
        render json: @checklist.errors,
               status: 500
      end
    end

  end
end
