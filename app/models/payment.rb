class Payment < ApplicationRecord
  belongs_to: user
  
  enum status: {
    paid: 0,
    pending: 1
  }
end
