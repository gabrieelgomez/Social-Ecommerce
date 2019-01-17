module Api::V1::Intranet::Checklists
  class ShowController < ChecklistsController
    before_action :set_intranets, only: %i[index show]
    before_action :set_intranet, only: %i[index show]
    before_action :set_checklists, only: %i[index]
    before_action :set_checklist, only: %i[show]

    def index
      render json: @checklists, status: 200
    end

    def show
      render json: @checklist, status: 200
    end

  end
end
