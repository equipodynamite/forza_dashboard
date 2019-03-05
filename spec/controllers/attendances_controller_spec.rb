require 'rails_helper'

RSpec.describe AttendancesController do
  before do
    @user = FactoryBot.create(:user)
    sign_in @user
  end

 describe "GET #index" do
   it 'returns http success' do
     get :index
     expect(response).to have_http_status(:success)
   end
   it 'shows the attendances for the current week' do
     FactoryBot.create(:attendance, user_id: @user.id, date: 3.days.ago)
     FactoryBot.create(:attendance, user_id: @user.id, date: 5.days.ago)
     FactoryBot.create(:attendance, user_id: @user.id, date: 9.days.ago)

     get :index, {
       params: {
         start_date: 6.days.ago.strftime('%m/%d/%Y'),
         end_date: Time.now.strftime('%m/%d/%Y')
       }
     }

     expect(Attendance.all.count).to eq(3)
     expect(assigns(:attendances_count)).to eq(2)
   end
 end
end
