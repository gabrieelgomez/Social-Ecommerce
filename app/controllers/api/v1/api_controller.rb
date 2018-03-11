module Api::V1
  class ApiController < ApplicationController
    before_action :authenticate_user!
    respond_to :json

    def index
      @current = current_user
      render json: @current
    end
  end
end
