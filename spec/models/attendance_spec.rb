require 'rails_helper'

RSpec.describe Attendance, type: :model do
  it { should belong_to(:user)}
end
