require 'rails_helper'

RSpec.describe User, type: :model do
  let(:user) { FactoryBot.build(:user) }
  subject { user }

  context 'validations' do
  	it { should validate_presence_of(:email) }
  	it { should validate_presence_of(:username) }
  	it { should validate_presence_of(:password) }
  	# it { should be_valid }
  end

  context 'associations' do
  	it { should have_many(:payments) }
  	it { should have_many(:objectives) }
  	it { should have_many(:attendances) }
  	it { should have_many(:physical_tests) }
    it { should have_and_belong_to_many(:roles) }
  end
end
