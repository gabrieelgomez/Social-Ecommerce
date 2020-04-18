module Api::V1::WaveCitizen::Citizens
  class CreateController < CitizensController

    def create
      @user    = User.new()
      @citizen = @user.build_citizen(citizen_params)

      @user.email = @citizen.email
      @user.name = @citizen.name
      @user.nickname = @citizen.nickname
      @user.password = params.dig(:citizen, :password)
      @user.password_confirmation = params.dig(:citizen, :password_confirmation)
      @citizen.status_citizen.eql?('citizen') ? @user.add_role(:citizen) : @user.add_role(:candidate)

      if @user.save
        render json: @citizen,
               serializer: WaveCitizen::CitizenSerializer,
               status: 200
      else
        render json: {
                citizen: @citizen.errors,
                user: @user.errors,
              },
               status: 422
      end
    end

  end
end
