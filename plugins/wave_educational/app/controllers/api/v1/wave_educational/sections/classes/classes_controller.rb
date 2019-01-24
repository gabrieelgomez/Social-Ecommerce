module Api::V1::WaveEducational::Sections
  class Classes::ClassesController < SectionsController

    private

    def set_course
      @course = WaveEducational::Course.find(params[:course_id])
    end

    def set_section
      @section = WaveEducational::Section.find(params[:section_id])
    end

    def set_class
      @class = WaveEducational::Class.find(params[:class_id])
    end

    def class_params
      params.require(:class).permit(:title, :description, :status, :published, :content, :section_id)
    end

  end
end
