module Api::V1::WaveCitizen::Citizens
  class DestroyController < CitizensController
    before_action :set_citizen, only: %i[destroy]

    def destroy
      if @citizen.destroy
        render json: @citizen, status: 200
      else
        render json: @citizen.errors,
               status: 422
      end
    end

  end
end
