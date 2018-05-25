module Api::V1
  class ApiController < ApplicationController
    include ErrorSerializer
    include Concerns::PasswordValidation
    respond_to :json

    private

    def general_params(object)
      params.require(object).permit(:user_id, :title, :name, :type_profile,
                                      :email, :banner, :photo, :launched,
                                      :phone,:url, :address, :vision, :mission,
                                      :description,:web, :profile, :experience,
                                      :country)
    end

    def custom_find
      yield
    rescue ActiveRecord::RecordNotFound
      render json: {
        error: [
          'Record not found'
        ]
      }, status: 404
    end
  end
end
