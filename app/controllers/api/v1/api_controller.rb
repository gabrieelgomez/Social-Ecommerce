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

    def rescue_not_found(class_name)
      render json: {
        errors: [
          "#{class_name}: #{ I18n.t :not_found.to_s }"
        ]
      }, status: 404
    end

    def custom_find
      yield
    rescue ActiveRecord::RecordNotFound => error
      rescue_not_found(error.model)
    end
  end
end
