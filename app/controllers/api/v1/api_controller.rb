module Api::V1
  class ApiController < ApplicationController
    include ErrorSerializer

    respond_to :json

    def index
      @current = current_user
      render json: @current
    end
  end
end
