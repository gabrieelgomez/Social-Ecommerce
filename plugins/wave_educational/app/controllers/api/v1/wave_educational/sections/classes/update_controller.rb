module Api::V1::WaveEducational::Sections::Classes
  class UpdateController < ClassesController
    before_action :set_class, only: %i[update]

    def update
      if @class.update(class_params)
        render json: @class, status: 200
      else
        render json: @class.errors,
               status: 500
      end
    end

  end
end
