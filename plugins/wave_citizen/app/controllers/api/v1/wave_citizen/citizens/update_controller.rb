module Api::V1::WaveCitizen::Citizens
  class UpdateController < CitizensController
    before_action :set_citizen, only: %i[update]

    def update
      if @citizen.update(citizen_params)
        @citizen.user.update(
          email: @citizen.email,
          nickname: @citizen.nickname,
          name: @citizen.name
        )
        render json: @citizen, status: 200
      else
        render json: @citizen.errors,
               status: 422
      end
    end

  end
end
