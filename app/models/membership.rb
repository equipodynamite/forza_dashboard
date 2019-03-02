class Membership < ApplicationRecord
  has_many :users

  enum duration: {
    Monthly: 1,
    Yearly: 2
  }
end
