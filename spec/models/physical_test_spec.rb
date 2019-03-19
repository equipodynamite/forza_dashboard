require 'rails_helper'

RSpec.describe PhysicalTest, type: :model do
  let(:physical_test) { FactoryBot.build(:physical_test) }
  subject { physical_test }

  context 'validations' do
		it { should validate_presence_of(:suggested_program) }
		it { should validate_presence_of(:squats) }
		it { should validate_presence_of(:pull_ups) }
		it { should validate_presence_of(:push_ups) }
		it { should validate_presence_of(:crunches) }
		it { should validate_presence_of(:squats_rom) }
		it { should validate_presence_of(:pull_ups_rom) }
		it { should validate_presence_of(:push_ups_rom) }
		it { should validate_presence_of(:crunches_rom) }
		it { should validate_presence_of(:squats_form) }
		it { should validate_presence_of(:pull_ups_form) }
		it { should validate_presence_of(:push_ups_form) }
		it { should validate_presence_of(:crunches_form) }
		it { should validate_presence_of(:squats_core) }
		it { should validate_presence_of(:pull_ups_core) }
		it { should validate_presence_of(:push_ups_core) }
		it { should validate_presence_of(:crunches_core) }
		it { should validate_presence_of(:squats_rhythm) }
		it { should validate_presence_of(:pull_ups_rhythm) }
		it { should validate_presence_of(:push_ups_rhythm) }
		it { should validate_presence_of(:crunches_rhythm) }
  end

  context 'associations' do
  	it { should belong_to(:user) }
  	it { should have_many(:tests) }
  end
end
