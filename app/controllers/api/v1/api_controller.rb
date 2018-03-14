module Api::V1
  class ApiController < ApplicationController
    include ErrorSerializer

    respond_to :json

    def index
      @current = current_user
      render json: @current
    end

    private

    def general_params(object)
      params.require(object).permit(:title, :name, :email,
                                    :phone, :url, :address)
    end
  end
end
