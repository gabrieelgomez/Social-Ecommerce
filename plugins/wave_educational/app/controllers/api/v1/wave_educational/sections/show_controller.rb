module Api::V1::WaveEducational::Sections
  class ShowController < SectionsController
    before_action :set_course, only: [:index]
    before_action :set_section, only: [:show]

    def index
      render json: @course.sections.order(id: :asc), status: 200
    end

    def show
      render json: @section, status: 200
    end

  end
end
