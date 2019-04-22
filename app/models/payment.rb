class Payment < ApplicationRecord
  belongs_to :user
  attr_accessor :username

  enum status: {
    paid: 0,
    pending: 1
  }
end
