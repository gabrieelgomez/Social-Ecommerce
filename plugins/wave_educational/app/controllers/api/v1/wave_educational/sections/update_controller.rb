module Api::V1::WaveEducational::Sections
  class UpdateController < SectionsController
    before_action :set_section, only: %i[update]

    def update
      if @section.update(section_params)
        render json: @section, status: 200
      else
        render json: @section.errors,
               status: 500
      end
    end

  end
end
