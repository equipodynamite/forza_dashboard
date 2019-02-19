require 'rails_helper'

RSpec.describe PhysicalTest, type: :model do
  let(:physical_test) { FactoryBot.build(:physical_test) }
  subject { physical_test }

  context 'validations' do
  	it { sould be_valid }
  end

  context 'associations' do
  	it { should belong_to(:user) }
  	it { should have_many(:tests) }
  end
end
