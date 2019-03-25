require 'rails_helper'

RSpec.describe Users::DashboardController, type: :controller do

  describe "GET #attendance" do
    it "returns http success" do
      get :attendance
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #payments" do
    it "returns http success" do
      get :payments
      expect(response).to have_http_status(:success)
    end
  end

end
