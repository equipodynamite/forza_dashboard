require 'rails_helper'

RSpec.describe Objective, type: :model do
  it { should belong_to(:user)}
end
