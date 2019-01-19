module Api::V1::WaveEducational::Sections::Classes
  class ShowController < ClassesController
    before_action :set_section, only: [:index]
    before_action :set_class, only: [:show]

    # Public methods
    def index
      render json: @section.classes.order(id: :asc), status: 200
    end

    def show
      render json: @class, status: 200
    end

  end
end
