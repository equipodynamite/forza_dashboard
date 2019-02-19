require 'rails_helper'

RSpec.describe Objective, type: :model do
  subject { Objective.new }
  it 'is valid with valid attributes' do
    subject.date = Datetime.now
    subject.user_id = 30
    subject.text = ""
    expect(subject).to be_valid
  end
end
