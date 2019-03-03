include Devise::Test::ControllerHelpers

RSpec.describe AttendancesController do
  before do
    @user = FactoryBot.create(:user)
    sign_in @user
  end

 describe "GET index" do
   it 'returns http success' do
     get :index
     expect(response).to have_http_status(:success)
   end
   it 'shows the attendances for the current week' do
     FactoryBot.create(:attendance, user_id: @user.id, date: 3.days.ago)
     FactoryBot.create(:attendance, user_id: @user.id, date: 5.days.ago)
     FactoryBot.create(:attendance, user_id: @user.id, date: 9.days.ago)
     get :index
     expect(assigns(:attendances_count)).to eq(3)
   end
 end
end
