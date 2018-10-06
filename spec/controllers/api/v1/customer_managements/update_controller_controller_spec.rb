require 'rails_helper'

RSpec.describe Api::V1::CustomerManagements::UpdateControllerController, type: :controller do

  describe "GET #update" do
    it "returns http success" do
      get :update
      expect(response).to have_http_status(:success)
    end
  end

end
