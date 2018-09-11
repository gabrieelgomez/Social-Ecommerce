module Api::V1
  class PolicyTerms::PolicyTermsController < ApiController
    before_action :authenticate_v1_user!
    before_action :verify_superadmin_rol

    private

    def policy_term_params
      params.require(:policy_term).permit(:term, :file)
    end

    def set_policy_term
      @policy_term = PolicyTerm.first
    end
  end
end
