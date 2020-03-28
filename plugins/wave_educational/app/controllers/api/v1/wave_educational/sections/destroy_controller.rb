module Api::V1::WaveEducational::Sections
  class DestroyController < SectionsController
    before_action :set_section, only: %i[destroy]

    def destroy
      if @section.destroy
        render json: @section, status: 200
      else
        render json: @section.errors,
               status: 422
      end
    end

  end
end
