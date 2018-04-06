module Api::V1
  class ApiController < ApplicationController
    include ErrorSerializer
    before_action :authenticate_v1_user!, only: [:index]
    respond_to :json

    def index
      @current = current_v1_user
      render json: @current
    end

    private

    def general_params(object)
      params.require(object).permit(:user_id, :type_profile, :title, :name)
    end
  end
end
