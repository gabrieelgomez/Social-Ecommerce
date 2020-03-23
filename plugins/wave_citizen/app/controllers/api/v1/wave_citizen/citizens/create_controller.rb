module Api::V1::WaveCitizen::Citizens
  class CreateController < CitizensController

    def create
      @user    = User.new(user_params)
      @citizen = @user.build_citizen(citizen_params)
      if @user.save
        render json: @citizen,
               serializer: WaveCitizen::CitizenSerializer,
               status: 200
      else
        render json: {
                citizen: @citizen.errors,
                user: @user.errors,
              },
               status: 201
      end
    end

  end
end
