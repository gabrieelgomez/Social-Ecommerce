module Api::V1::PolicyTerms
  class UpdateController < PolicyTermsController
    before_action :authenticate_v1_user!, only: %i[update]
    before_action :verify_superadmin_rol, only: %i[update]
    before_action :set_policy_term, only: %i[update]

    def update
      if @policy_term.update(policy_term_params)
        render json: @policy_term, status: 200
      else
        render json: @policy_term.errors, status: 422
      end
    end
  end
end
