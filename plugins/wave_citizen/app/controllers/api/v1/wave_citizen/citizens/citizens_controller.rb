module Api::V1::WaveCitizen
  class Citizens::CitizensController < WaveCitizenController

    private

    def set_citizen
      @citizen = WaveCitizen::Citizen.find_by(id: params[:citizen_id])
    end

    def citizen_params
      params.require(:citizen).permit(:status_citizen, :name, :banner, :nickname, :email, :avatar, :phone, :address,
                 :web, :description, :status_citizen, :type_candidacy_id)
    end

    def user_params
      params.require(:user).permit(:name, :lastname, :banner, :nickname, :avatar, :email, :phone_one, :phone_two, :description, :dni, :birth_date, :age, :gender, :country, :password, :password_confirmation, roles_attributes: [:id, :name, :_destroy])
    end

  end
end
