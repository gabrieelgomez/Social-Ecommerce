module Api::V1::WaveWork::TypeHierarchies
  class ShowController < TypeHierarchiesController
    before_action :set_type_hierarchy, only: [:show]

    def index
      render json: WaveWork::TypeHierarchy.all.order(id: :asc), status: 200
    end

    def show
      render json: @type_hierarchy, status: 200
    end

  end
end
