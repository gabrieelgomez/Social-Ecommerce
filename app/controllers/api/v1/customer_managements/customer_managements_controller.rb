module Api::V1
  class CustomerManagements::CustomerManagementsController < ApiController
    before_action :authenticate_v1_user!
  end
end
