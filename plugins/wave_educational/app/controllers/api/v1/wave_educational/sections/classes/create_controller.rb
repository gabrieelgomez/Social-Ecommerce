module Api::V1::WaveEducational::Sections::Classes
  class CreateController < ClassesController
    before_action :set_course, only: [:create]
    before_action :set_section, only: [:create]

    def create
      @class = WaveEducational::Class.new(class_params)
      @class.section = @section
      if @class.save
        render json: @class, status: 201
      else
        render json: @class.errors,
               status: 500
      end
    end

  end
end
