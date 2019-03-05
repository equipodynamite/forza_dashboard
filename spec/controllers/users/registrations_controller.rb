require 'rails_helper'

RSpec.describe Users::RegistrationsController do
    describe "GET #new" do
        it "should return http success" do
            @request.env['devise.mapping'] = Devise.mappings[:user]
            get :new
            expect(response).to be_success
        end
    end
end
