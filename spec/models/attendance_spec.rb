require 'rails_helper'

RSpec.describe Attendance, type: :model do
  subject { Attendance.new }
  it 'is valid with valid attributes' do
    subject.date = Datetime.now
    subject.user_id = 1
    expect(subject).to be_valid
  end
end
