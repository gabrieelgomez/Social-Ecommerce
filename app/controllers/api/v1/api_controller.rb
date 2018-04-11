module Api::V1
  class ApiController < ApplicationController
    include ErrorSerializer
    include Concerns::PasswordValidation
    respond_to :json

    private

    def general_params(object)
      params.require(object).permit(:user_id, :type_profile, :title, :name)
    end
  end
end
