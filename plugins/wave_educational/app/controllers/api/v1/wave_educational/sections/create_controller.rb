module Api::V1::WaveEducational::Sections
  class CreateController < SectionsController
    before_action :set_course, only: %i[create]


    def create
      @section = WaveEducational::Section.new(section_params)
      @section.course = @course
      if @section.save
        render json: @section, status: 200
      else
        render json: @section.errors,
               status: 422
      end
    end

  end
end
