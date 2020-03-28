module Api::V1::WaveEducational::Sections::Classes
  class DestroyController < ClassesController
    before_action :set_class, only: %i[destroy]

    def destroy
      if @class.destroy
        render json: @class, status: 200
      else
        render json: @class.errors,
               status: 422
      end
    end

  end
end
