class PhysicalTest < ApplicationRecord
  belongs_to: user
  has_many: tests

  enum suggested_program: {
    UBP: 1,
    MU: 2,
    INT: 3,
    AVZ: 4,
    PRS: 5
  }
end
