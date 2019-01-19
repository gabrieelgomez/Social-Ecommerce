module Api::V1::WaveEducational
  class Sections::SectionsController < WaveEducationalController

    private

    def set_course
      @course = WaveEducational::Course.find(params[:course_id])
    end

    def set_section
      @section = WaveEducational::Section.find(params[:section_id])
    end

    def section_params
      params.require(:section).permit(:title, :description, :status, :published,
                                      :course_id)
    end

  end
end
