require 'rails_helper'

RSpec.describe Role, type: :model do
  let(:role) { FactoryBot.build(:role) }
  subject { role }

  context 'validations' do
  	it { should be_valid }
  end

  context 'associations' do
  	it { should have_and_belong_to_many(:users) }
  end
end
