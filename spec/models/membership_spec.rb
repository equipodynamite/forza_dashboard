require 'rails_helper'

RSpec.describe Membership, type: :model do
  it { should have_many(:users) }
end
