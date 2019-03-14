module Api::V1
  class ApiController < ApplicationController
    include ErrorSerializer
    include Concerns::PasswordValidation
    respond_to :json

    private

    def fields(key)
      if params[:fields]
        result = {}
        result[key] = params[:fields].split(',').map(&:to_sym)
        return result
      else
        nil
      end
    end

    def general_params(object)
      params.require(object).permit(:title, :slug, :email, :banner, :photo,
                                    :launched, :phone, :address, :vision,
                                    :mission, :description, :web, :experience,
                                    category_ids: [])
    end

    def verify_superadmin_rol
      unless current_v1_user.has_role? :superadmin
        render json: {
          errors: [
            "You are not authorized to this action."
          ]
        }, status: 401
      end
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
