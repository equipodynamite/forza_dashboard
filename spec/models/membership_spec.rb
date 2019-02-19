require 'rails_helper'

RSpec.describe Membership, type: :model do
  subject { Membership.new }
  it 'is valid with valid attributes' do
    subject.start_date = Datetime.now
    subject.duration = 30
    expect(subject).to be_valid
  end
end
