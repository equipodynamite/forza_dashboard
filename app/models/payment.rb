class Payment < ApplicationRecord
  belongs_to :user
  validates_numericality_of :amount
  attr_accessor :username

  enum status: {
    paid: 0,
    pending: 1
  }
end
