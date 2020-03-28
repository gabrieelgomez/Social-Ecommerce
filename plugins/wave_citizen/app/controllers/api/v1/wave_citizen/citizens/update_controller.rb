module Api::V1::WaveCitizen::Citizens
  class UpdateController < CitizensController
    before_action :set_citizen, only: %i[update]

    def update
      if @citizen.update(citizen_params)
        render json: @citizen, status: 200
      else
        render json: @citizen.errors,
               status: 422
      end
    end

  end
end
